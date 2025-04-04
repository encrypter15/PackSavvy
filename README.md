# PackSavvy

## Overview
PackSavvy is a travel packing assistant web app designed to create optimized packing lists tailored to your trip details—destination, weather, duration, activities, and luggage size. Powered by AI, it minimizes overpacking, ensures essentials aren’t forgotten, and features a visual “Packing Simulator” to see how everything fits.

## Features
- **Trip Profiler**: Input trip details (e.g., “5 days in Paris, business + sightseeing, carry-on only”) to generate a custom packing list.
- **Weather Sync**: Integrates real-time weather forecasts to recommend appropriate clothing and gear.
- **Packing Simulator**: A drag-and-drop interface to visualize how items fit in your luggage, with size and weight estimates.
- **Checklist Mode**: (Planned) Interactive checklist to track packed items.
- **Shared Lists**: (Planned) Collaborate with travel companions to avoid duplicates.

## Installation
1. **Prerequisites**: Node.js (v16+ recommended) and npm.
2. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd packsavvy
   ```
3. **Backend Setup**:
   ```bash
   cd server
   npm install
   ```
   - Replace `YOUR_OPENWEATHERMAP_API_KEY` in `server/server.js` with a key from [OpenWeatherMap](https://openweathermap.org/).
   - Start the server:
     ```bash
     npm start
     ```
4. **Frontend Setup**:
   ```bash
   cd client
   npm install
   npm start
   ```
   - The app will open at `http://localhost:3000`.

## Usage
1. Enter your trip details in the Trip Profiler form.
2. Click “Generate Packing List” to fetch a list and weather data.
3. Drag items in the Packing Simulator to arrange them in the virtual suitcase.

## Author
- **Rick Hayes**

## Version
- **1.0**

## License
This project is licensed under the MIT License - see below for details.

```
MIT License

Copyright (c) 2025 Rick Hayes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Future Enhancements
- Add shared list collaboration with real-time updates.
- Implement a checklist mode with reminders.
- Expand the simulator to 3D or add luggage size limits.

## Contributing
Feel free to submit issues or pull requests to improve PackSavvy!
```

### Notes:
- Save this as `README.md` in the `packsavvy/` root directory.
- It includes setup instructions, usage, and placeholders for planned features (e.g., Checklist Mode, Shared Lists).
- The MIT License is included inline as specified.

