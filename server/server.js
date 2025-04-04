const express = require('express');
const axios = require('axios');
const cors = require('cors');
const mysql = require('mysql2/promise');
const app = express();

app.use(cors());
app.use(express.json());

// API Keys (replace with your actual keys)
const OPENWEATHERMAP_API_KEY = 'YOUR_OPENWEATHERMAP_API_KEY';
const GOOGLE_GEMINI_API_KEY = 'YOUR_GEMINI_API_KEY';
const OPENAI_API_KEY = 'YOUR_OPENAI_API_KEY';
const XAI_API_KEY = 'YOUR_XAI_API_KEY';

// MySQL connection pool
const db = mysql.createPool({
  host: 'localhost',
  user: 'root',           // Replace with your MySQL username
  password: 'your_password', // Replace with your MySQL password
  database: 'packsavvy',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Function to call Gemini AI
async function getGeminiSuggestions(tripDetails) {
  const prompt = `Suggest a packing list for a ${tripDetails.days}-day trip to ${tripDetails.destination} for ${tripDetails.activities.join(' and ')} with ${tripDetails.luggage}.`;
  try {
    const response = await axios.post(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent',
      { contents: [{ parts: [{ text: prompt }] }] },
      { headers: { 'Authorization': `Bearer ${GOOGLE_GEMINI_API_KEY}', 'Content-Type': 'application/json' } }
    );
    return parseAIResponse(response.data.candidates[0].content.parts[0].text);
  } catch (error) {
    console.error('Gemini API error:', error);
    return [];
  }
}

// Function to call ChatGPT
async function getChatGPTSuggestions(tripDetails) {
  const prompt = `Suggest a packing list for a ${tripDetails.days}-day trip to ${tripDetails.destination} for ${tripDetails.activities.join(' and ')} with ${tripDetails.luggage}. Include weights and sizes if possible.`;
  try {
    const response = await axios.post(
      'https://api.openai.com/v1/chat/completions',
      { model: 'gpt-4', messages: [{ role: 'user', content: prompt }] },
      { headers: { 'Authorization': `Bearer ${OPENAI_API_KEY}', 'Content-Type': 'application/json' } }
    );
    return parseAIResponse(response.data.choices[0].message.content);
  } catch (error) {
    console.error('ChatGPT API error:', error);
    return [];
  }
}

// Function to call xAI
async function getXAISuggestions(tripDetails) {
  const prompt = `Suggest a packing list for a ${tripDetails.days}-day trip to ${tripDetails.destination} for ${tripDetails.activities.join(' and ')} with ${tripDetails.luggage}.`;
  try {
    const response = await axios.post(
      'https://api.x.ai/v1/chat/completions',
      {
        model: 'grok-beta',
        messages: [{ role: 'system', content: 'You are a helpful packing assistant.' }, { role: 'user', content: prompt }],
        max_tokens: 200,
      },
      { headers: { 'Authorization': `Bearer ${XAI_API_KEY}', 'Content-Type': 'application/json' } }
    );
    return parseAIResponse(response.data.choices[0].message.content);
  } catch (error) {
    console.error('xAI API error:', error.response?.data || error.message);
    return [];
  }
}

// Parse AI response into structured items
function parseAIResponse(text) {
  const lines = text.split('\n').filter(line => line.trim());
  return lines.map(line => {
    const name = line.replace(/[-*]\s*/, '').trim();
    return { name, weight: 0.5, size: { w: 3, h: 3 } };
  });
}

// Fetch base items from MySQL
async function getBaseItems() {
  const [rows] = await db.query('SELECT name, weight, size_width AS w, size_height AS h FROM base_items');
  return rows.map(row => ({
    name: row.name,
    weight: row.weight,
    size: { w: row.w, h: row.h }
  }));
}

// Fetch luggage profile from MySQL
async function getLuggageProfile(luggageName) {
  const [rows] = await db.query('SELECT * FROM luggage_profiles WHERE name = ?', [luggageName]);
  if (rows.length === 0) {
    return { name: 'Standard Carry-On', maxWeight: 15, dimensions: { w: 22, h: 14, d: 9 } };
  }
  const row = rows[0];
  return {
    name: row.name,
    maxWeight: row.max_weight,
    dimensions: { w: row.width, h: row.height, d: row.depth }
  };
}

// Generate packing list with luggage constraints
async function generatePackingList(tripDetails) {
  const [geminiItems, chatGPTItems, xAIItems, baseItems] = await Promise.all([
    getGeminiSuggestions(tripDetails),
    getChatGPTSuggestions(tripDetails),
    getXAISuggestions(tripDetails),
    getBaseItems()
  ]);

  const allItems = [...baseItems, ...geminiItems, ...chatGPTItems, ...xAIItems];
  const uniqueItems = Array.from(new Map(allItems.map(item => [item.name, item])).values());

  const luggage = await getLuggageProfile(tripDetails.luggage);
  const maxWeight = luggage.maxWeight;
  const maxSize = luggage.dimensions;

  // Filter and prioritize items based on luggage constraints
  let totalWeight = 0;
  const filteredItems = [];
  for (const item of uniqueItems) {
    if (totalWeight + item.weight <= maxWeight &&
        item.size.w <= maxSize.w && item.size.h <= maxSize.h) {
      filteredItems.push(item);
      totalWeight += item.weight;
    }
    if (tripDetails.activities.includes('business') && item.name.includes('Suit')) filteredItems.push(item);
    if (tripDetails.activities.includes('sightseeing') && item.name.includes('Camera')) filteredItems.push(item);
  }

  return { items: filteredItems, luggage };
}

// Weather-enhanced packing list endpoint
app.post('/api/packing-list', async (req, res) => {
  const { destination, days, activities, luggage } = req.body;
  try {
    const weatherRes = await axios.get(
      `https://api.openweathermap.org/data/2.5/forecast?q=${destination}&appid=${OPENWEATHERMAP_API_KEY}&units=metric`
    );
    const forecast = weatherRes.data.list[0];
    const temp = forecast.main.temp;
    const weather = forecast.weather[0].main;

    const tripDetails = { destination, days, activities, luggage };
    const { items: packingList, luggage: selectedLuggage } = await generatePackingList(tripDetails);

    // Weather-based adjustments
    if (temp < 15) packingList.push({ name: 'Jacket', weight: 1.5, size: { w: 5, h: 6 } });
    if (weather === 'Rain') packingList.push({ name: 'Umbrella', weight: 0.8, size: { w: 2, h: 5 } });

    res.json({ packingList, weather: { temp, condition: weather }, luggage: selectedLuggage });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ error: 'Failed to generate packing list' });
  }
});

// Endpoint to get all luggage profiles
app.get('/api/luggage-profiles', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT name FROM luggage_profiles');
    res.json(rows.map(row => row.name));
  } catch (error) {
    console.error('Error fetching luggage profiles:', error);
    res.status(500).json({ error: 'Failed to fetch luggage profiles' });
  }
});

app.listen(5000, () => console.log('Server running on port 5000'));
