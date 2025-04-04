import React, { useState } from 'react';
import axios from 'axios';
import Draggable from 'react-draggable';
import './App.css';

function App() {
  const [tripDetails, setTripDetails] = useState({
    destination: '',
    days: '',
    activities: [],
    luggage: 'carry-on',
  });
  const [packingList, setPackingList] = useState([]);
  const [weather, setWeather] = useState(null);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setTripDetails({ ...tripDetails, [name]: value });
  };

  const handleActivityChange = (e) => {
    const activity = e.target.value;
    const activities = tripDetails.activities.includes(activity)
      ? tripDetails.activities.filter((a) => a !== activity)
      : [...tripDetails.activities, activity];
    setTripDetails({ ...tripDetails, activities });
  };

  const fetchPackingList = async () => {
    try {
      const res = await axios.post('http://localhost:5000/api/packing-list', tripDetails);
      setPackingList(res.data.packingList);
      setWeather(res.data.weather);
    } catch (error) {
      console.error('Error fetching packing list:', error);
    }
  };

  return (
    <div className="App">
      <h1>PackSavvy</h1>

      {/* Trip Profiler */}
      <div className="trip-profiler">
        <input
          name="destination"
          placeholder="Destination (e.g., Paris)"
          value={tripDetails.destination}
          onChange={handleInputChange}
        />
        <input
          name="days"
          type="number"
          placeholder="Days"
          value={tripDetails.days}
          onChange={handleInputChange}
        />
        <div>
          <label>
            <input
              type="checkbox"
              value="business"
              onChange={handleActivityChange}
            /> Business
          </label>
          <label>
            <input
              type="checkbox"
              value="sightseeing"
              onChange={handleActivityChange}
            /> Sightseeing
          </label>
        </div>
        <select name="luggage" onChange={handleInputChange}>
          <option value="carry-on">Carry-On</option>
          <option value="checked">Checked Bag</option>
        </select>
        <button onClick={fetchPackingList}>Generate Packing List</button>
      </div>

      {/* Weather Display */}
      {weather && (
        <div>
          <h3>Weather in {tripDetails.destination}</h3>
          <p>Temp: {weather.temp}°C, Condition: {weather.condition}</p>
        </div>
      )}

      {/* Packing Simulator */}
      <div className="simulator">
        <h3>Packing Simulator</h3>
        <div className="suitcase">
          {packingList.map((item, index) => (
            <Draggable key={index} bounds="parent">
              <div
                className="item"
                style={{ width: `${item.size.w * 20}px`, height: `${item.size.h * 20}px` }}
              >
                {item.name} ({item.weight} lbs)
              </div>
            </Draggable>
          ))}
        </div>
      </div>
    </div>
  );
}

export default App;
