# PackSavvy

## Overview
PackSavvy is a travel packing assistant web app designed to create optimized packing lists tailored to your trip details—destination, weather, duration, activities, and luggage size. Powered by AI (Gemini, ChatGPT, and xAI), it minimizes overpacking, ensures essentials aren’t forgotten, and features a visual “Packing Simulator” to see how everything fits. Data is stored in a MySQL database, including 200 real-world base items and 100 luggage profiles.

## Features
- **Trip Profiler**: Input trip details (e.g., “5 days in Paris, business + sightseeing, carry-on only”) to generate a custom packing list.
- **Weather Sync**: Integrates real-time weather forecasts (OpenWeatherMap API) to recommend appropriate clothing and gear.
- **Packing Simulator**: A drag-and-drop interface to visualize how items fit in your luggage, with size and weight estimates.
- **Luggage Profiles**: Choose from 100 predefined luggage options (e.g., "Osprey Farpoint 40L") with max weight and dimensions, stored in MySQL.
- **Base Items**: 200 real-world items (e.g., toothbrush, hiking boots) as a fallback, fetched from MySQL.
- **AI-Powered Suggestions**: Combines outputs from Gemini, ChatGPT, and xAI’s Grok for smart packing lists.

## Installation
1. **Prerequisites**:
   - Node.js (v16+ recommended) and npm.
   - MySQL (v8.0+ recommended).

2. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd packsavvy
   ```

3. **Database Setup**:
   - Start MySQL: `sudo service mysql start` (Linux) or equivalent.
   - Create and populate the database:
     ```bash
     mysql -u root -p < packsavvy_setup.sql
     ```
   - Update `server/server.js` with your MySQL credentials (host, user, password).

4. **Backend Setup**:
   ```bash
   cd server
   npm install
   ```
   - Replace API keys in `server/server.js`:
     - `OPENWEATHERMAP_API_KEY`: [OpenWeatherMap](https://openweathermap.org/)
     - `GOOGLE_GEMINI_API_KEY`: [Google Cloud Console](https://console.cloud.google.com/)
     - `OPENAI_API_KEY`: [OpenAI API](https://platform.openai.com/)
     - `XAI_API_KEY`: [xAI Console](https://console.x.ai/)
   - Start the server:
     ```bash
     npm start
     ```

5. **Frontend Setup**:
   ```bash
   cd client
   npm install
   npm start
   ```
   - The app will open at `http://localhost:3000`.

## Usage
1. Enter your trip details in the Trip Profiler form (destination, days, activities, luggage).
2. Click “Generate Packing List” to fetch a list, weather data, and luggage profile.
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
- **Checklist Mode**: Interactive checklist with reminders.
- **Shared Lists**: Real-time collaboration for group packing.
- **Advanced AI**: Train a custom ML model on user habits.
- **Custom Items/Luggage**: UI to add user-defined items and luggage profiles to MySQL.

## Contributing
Feel free to submit issues or pull requests to improve PackSavvy!
```

---

### Key Updates
1. **Overview**: Updated to mention MySQL storage with 200 base items and 100 luggage profiles, and the use of three AI APIs.
2. **Features**: Added details about MySQL-backed base items and luggage profiles, and clarified AI integration.
3. **Installation**: Included MySQL setup steps, referencing `packsavvy_setup.sql`, and updated dependency installation instructions.
4. **Usage**: Kept simple but reflects the current functionality.
5. **Future Enhancements**: Adjusted to reflect implemented features (e.g., luggage profiles) and remaining goals.

### Notes
- Save this as `README.md` in the `packsavvy/` root directory.
- Ensure `packsavvy_setup.sql` (from the previous response) is in the same directory for the setup command to work.
- The instructions assume a basic development environment; for production, you’d add security (e.g., `.env` for credentials) and deployment steps.

