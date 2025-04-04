const express = require('express');
const axios = require('axios');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

const API_KEY = 'YOUR_OPENWEATHERMAP_API_KEY'; // Replace with your OpenWeatherMap API key

// Mock AI packing logic
const generatePackingList = (tripDetails) => {
  const { destination, days, activities, luggage } = tripDetails;
  const baseItems = [
    { name: 'Toothbrush', weight: 0.1, size: { w: 1, h: 4 } },
    { name: 'Phone Charger', weight: 0.2, size: { w: 2, h: 2 } },
  ];
  if (activities.includes('business')) baseItems.push({ name: 'Suit', weight: 2, size: { w: 6, h: 8 } });
  if (activities.includes('sightseeing')) baseItems.push({ name: 'Camera', weight: 1, size: { w: 4, h: 3 } });
  return baseItems;
};

// Endpoint to generate packing list with weather data
app.post('/api/packing-list', async (req, res) => {
  const { destination, days, activities, luggage } = req.body;
  try {
    const weatherRes = await axios.get(
      `https://api.openweathermap.org/data/2.5/forecast?q=${destination}&appid=${API_KEY}&units=metric`
    );
    const forecast = weatherRes.data.list[0]; // Use first forecast  forecast entry
    const temp = forecast.main.temp;
    const weather = forecast.weather[0].main;

    const packingList = generatePackingList({ destination, days, activities, luggage });
    if (temp < 15) packingList.push({ name: 'Jacket', weight: 1.5, size: { w: 5, h: 6 } });
    if (weather === 'Rain') packingList.push({ name: 'Umbrella', weight: 0.8, size: { w: 2, h: 5 } });

    res.json({ packingList, weather: { temp, condition: weather } });
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch weather or generate list' });
  }
});

app.listen(5000, () => console.log('Server running on port 5000'));
