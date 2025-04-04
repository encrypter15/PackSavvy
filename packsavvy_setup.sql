-- Create database
DROP DATABASE IF EXISTS packsavvy;
CREATE DATABASE packsavvy;
USE packsavvy;

-- Create base_items table
CREATE TABLE base_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  weight DECIMAL(5,2) NOT NULL, -- in pounds
  size_width INT NOT NULL,      -- arbitrary units for simulator
  size_height INT NOT NULL      -- arbitrary units for simulator
);

-- Create luggage_profiles table
CREATE TABLE luggage_profiles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  max_weight DECIMAL(5,2) NOT NULL, -- in pounds
  width DECIMAL(5,2) NOT NULL,      -- in inches
  height DECIMAL(5,2) NOT NULL,     -- in inches
  depth DECIMAL(5,2) NOT NULL       -- in inches
);

-- Populate base_items with 200 real-world items
INSERT INTO base_items (name, weight, size_width, size_height) VALUES
  ('Toothbrush', 0.1, 1, 4), ('Toothpaste', 0.2, 2, 3), ('Phone Charger', 0.2, 2, 2), 
  ('T-shirt', 0.3, 4, 4), ('Jeans', 1.0, 6, 6), ('Underwear (pair)', 0.1, 2, 2), 
  ('Socks (pair)', 0.1, 2, 2), ('Shampoo (travel size)', 0.2, 2, 3), ('Conditioner (travel size)', 0.2, 2, 3), 
  ('Body Wash (travel size)', 0.2, 2, 3), ('Deodorant', 0.2, 2, 3), ('Razor', 0.1, 1, 3), 
  ('Shaving Cream (travel size)', 0.2, 2, 2), ('Hairbrush', 0.2, 3, 4), ('Hair Ties (pack)', 0.1, 1, 1), 
  ('Sunglasses', 0.1, 3, 1), ('Hat', 0.3, 4, 3), ('Wallet', 0.2, 3, 2), 
  ('Passport', 0.1, 3, 2), ('Travel Adapter', 0.2, 2, 2), ('Headphones', 0.3, 3, 2), 
  ('Laptop', 3.0, 10, 7), ('Laptop Charger', 0.5, 4, 3), ('Book', 0.8, 5, 7), 
  ('Notebook', 0.4, 4, 6), ('Pen', 0.1, 1, 4), ('Water Bottle (empty)', 0.5, 2, 6), 
  ('Snacks (small pack)', 0.3, 3, 3), ('Sweater', 0.7, 5, 5), ('Jacket', 1.5, 6, 6), 
  ('Raincoat', 0.8, 5, 5), ('Umbrella', 0.8, 2, 5), ('Swimsuit', 0.2, 3, 3), 
  ('Flip Flops', 0.4, 4, 3), ('Sneakers', 1.2, 6, 4), ('Dress Shoes', 1.0, 5, 4), 
  ('Suit Jacket', 1.5, 6, 7), ('Dress Shirt', 0.4, 5, 5), ('Tie', 0.1, 2, 4), 
  ('Belt', 0.3, 3, 2), ('Shorts', 0.4, 4, 4), ('Pajamas', 0.5, 5, 5), 
  ('Towel (travel size)', 0.5, 4, 4), ('Sunscreen (travel size)', 0.2, 2, 3), ('Bug Spray (travel size)', 0.2, 2, 3), 
  ('First Aid Kit (small)', 0.3, 3, 2), ('Pain Relievers (pack)', 0.1, 1, 1), ('Prescription Meds', 0.2, 2, 2), 
  ('Glasses', 0.1, 3, 1), ('Contact Lenses', 0.1, 1, 1), ('Camera', 1.0, 4, 3), 
  ('Camera Charger', 0.3, 3, 2), ('Tripod (small)', 0.8, 2, 6), ('Memory Card', 0.1, 1, 1), 
  ('Power Bank', 0.5, 3, 2), ('USB Cable', 0.1, 2, 1), ('Earplugs', 0.1, 1, 1), 
  ('Sleep Mask', 0.1, 2, 2), ('Travel Pillow', 0.5, 4, 4), ('Laundry Bag', 0.2, 3, 3), 
  ('Laundry Detergent (sheets)', 0.1, 2, 1), ('Reusable Shopping Bag', 0.2, 3, 3), ('Scarf', 0.3, 4, 3), 
  ('Gloves', 0.2, 3, 2), ('Beanie', 0.2, 3, 2), ('Hiking Boots', 2.0, 6, 5), 
  ('Hiking Poles (collapsible)', 1.0, 2, 6), ('Backpack (daypack)', 1.0, 6, 8), ('Rain Cover (for backpack)', 0.3, 3, 3), 
  ('Flashlight', 0.3, 2, 4), ('Batteries (AA, pack)', 0.2, 2, 1), ('Multi-tool', 0.4, 2, 3), 
  ('Sewing Kit (small)', 0.1, 2, 1), ('Duct Tape (small roll)', 0.2, 2, 2), ('Ziplock Bags (pack)', 0.1, 3, 2), 
  ('Travel Lock', 0.2, 2, 1), ('Money Belt', 0.2, 4, 2), ('Credit Cards', 0.1, 2, 1), 
  ('Cash (small amount)', 0.1, 2, 1), ('Boarding Pass (printed)', 0.1, 3, 2), ('Travel Insurance Docs', 0.1, 3, 2), 
  ('Map (folded)', 0.2, 3, 3), ('Guidebook', 0.8, 5, 7), ('Sunglasses Case', 0.2, 3, 2), 
  ('Lip Balm', 0.1, 1, 1), ('Hand Sanitizer (travel size)', 0.2, 2, 3), ('Face Mask (pack)', 0.1, 2, 2), 
  ('Tissues (travel pack)', 0.1, 2, 2), ('Watch', 0.1, 2, 1), ('Jewelry (small pouch)', 0.2, 2, 2), 
  ('Yoga Mat (travel)', 1.0, 6, 4), ('Workout Clothes', 0.5, 4, 4), ('Running Shoes', 1.0, 5, 4), 
  ('Swim Goggles', 0.2, 2, 2), ('Beach Towel', 0.7, 5, 5), ('Beach Bag', 0.4, 5, 4), 
  ('Playing Cards', 0.2, 2, 2), ('Travel Journal', 0.4, 4, 6), ('Portable Speaker', 0.5, 3, 3),
  ('Comb', 0.1, 2, 3), ('Hair Gel (travel size)', 0.2, 2, 2), ('Nail Clippers', 0.1, 1, 1),
  ('Moisturizer (travel size)', 0.2, 2, 3), ('Cotton Pads (pack)', 0.1, 2, 2), ('Facial Cleanser (travel size)', 0.2, 2, 3),
  ('Tank Top', 0.2, 3, 3), ('Leggings', 0.6, 5, 5), ('Hoodie', 0.8, 6, 5),
  ('Winter Coat', 2.5, 8, 7), ('Thermal Shirt', 0.3, 4, 4), ('Thermal Pants', 0.4, 5, 5),
  ('Snow Boots', 2.5, 7, 6), ('Ski Goggles', 0.3, 3, 2), ('Ski Gloves', 0.4, 4, 3),
  ('Snow Pants', 1.2, 6, 6), ('Wool Socks (pair)', 0.2, 2, 3), ('Base Layer Top', 0.3, 4, 4),
  ('Base Layer Bottom', 0.3, 4, 4), ('Fleece Jacket', 0.9, 6, 5), ('Windbreaker', 0.7, 5, 5),
  ('Sandals', 0.5, 4, 3), ('Sun Hat', 0.2, 4, 2), ('Beach Cover-Up', 0.3, 4, 4),
  ('Snorkel Mask', 0.6, 4, 3), ('Fins (pair)', 1.5, 8, 4), ('Dry Bag', 0.4, 4, 4),
  ('Camping Stove (small)', 1.0, 4, 4), ('Fuel Canister', 0.5, 2, 4), ('Cookware Set (small)', 0.8, 5, 4),
  ('Utensils (set)', 0.2, 2, 3), ('Camping Mug', 0.3, 2, 3), ('Sleeping Bag (compact)', 2.0, 6, 6),
  ('Sleeping Pad', 1.0, 6, 4), ('Tent (1-person)', 3.0, 8, 6), ('Ground Tarp', 0.5, 5, 5),
  ('Headlamp', 0.2, 2, 2), ('Water Filter', 0.3, 2, 4), ('Hydration Bladder', 0.4, 4, 4),
  ('Trekking Poles (pair)', 1.0, 2, 6), ('Compass', 0.1, 2, 2), ('Whistle', 0.1, 1, 1),
  ('Binoculars', 0.8, 4, 3), ('Fishing Rod (collapsible)', 1.2, 2, 8), ('Fishing Tackle (small)', 0.3, 3, 2),
  ('Sunscreen Stick', 0.1, 1, 2), ('After-Sun Lotion (travel size)', 0.2, 2, 3), ('Beach Umbrella (small)', 1.5, 3, 6),
  ('Cooler Bag (small)', 0.8, 5, 4), ('Ice Pack', 0.5, 3, 2), ('Picnic Blanket', 0.7, 5, 5),
  ('Wine Opener', 0.2, 2, 2), ('Reusable Cutlery Set', 0.2, 2, 3), ('Travel Coffee Maker (manual)', 0.5, 3, 4),
  ('Coffee Grounds (small pack)', 0.3, 2, 2), ('Tea Bags (pack)', 0.1, 2, 1), ('Insulated Bottle', 0.7, 2, 6),
  ('Bluetooth Earbuds', 0.1, 2, 1), ('E-reader', 0.4, 5, 4), ('Tablet', 1.0, 8, 6),
  ('Tablet Charger', 0.3, 3, 2), ('Portable Fan (small)', 0.4, 3, 3), ('Hair Dryer (travel)', 0.8, 4, 4),
  ('Curling Iron (travel)', 0.6, 3, 4), ('Makeup Bag (small)', 0.5, 4, 3), ('Foundation (travel size)', 0.2, 2, 2),
  ('Mascara', 0.1, 1, 2), ('Lipstick', 0.1, 1, 2), ('Blush', 0.1, 2, 1),
  ('Eye Shadow Palette (small)', 0.2, 3, 2), ('Makeup Brushes (set)', 0.3, 3, 3), ('Nail Polish', 0.1, 1, 2),
  ('Perfume (travel size)', 0.1, 1, 2), ('Body Lotion (travel size)', 0.2, 2, 3), ('Shaving Kit (small)', 0.3, 3, 2),
  ('Beach Ball', 0.2, 3, 3), ('Frisbee', 0.1, 4, 4), ('Soccer Ball (deflated)', 0.3, 4, 4),
  ('Bike Repair Kit', 0.5, 3, 3), ('Bike Lock', 0.7, 3, 4), ('Helmet (compact)', 1.0, 5, 4),
  ('Ski Poles (collapsible)', 1.0, 2, 6), ('Ski Helmet', 1.2, 5, 5), ('Snowboard Wax Kit', 0.4, 3, 2);

-- Populate luggage_profiles with 100 real-world luggage options
INSERT INTO luggage_profiles (name, max_weight, width, height, depth) VALUES
  ('Standard Carry-On', 15.0, 22.0, 14.0, 9.0), ('Checked Bag', 50.0, 27.0, 21.0, 11.0), 
  ('Osprey Farpoint 40L', 20.0, 20.0, 14.0, 8.0), ('Samsonite Omni 20"', 15.0, 20.0, 14.0, 9.0), 
  ('Away Carry-On', 15.0, 21.7, 13.7, 9.0), ('Travelpro Maxlite 5 21"', 15.0, 21.0, 14.0, 9.0), 
  ('Delsey Paris Helium 19"', 15.0, 19.0, 13.0, 9.0), ('American Tourister Moonlight 21"', 15.0, 21.0, 14.0, 9.0), 
  ('Patagonia Black Hole 32L', 18.0, 20.0, 13.0, 8.0), ('North Face Base Camp Duffel S', 25.0, 20.0, 12.0, 12.0), 
  ('Eagle Creek Gear Warrior 22"', 15.0, 22.0, 14.0, 9.0), ('REI Co-op Big Haul 40', 20.0, 22.0, 14.0, 8.0), 
  ('Tumi Alpha 3 Carry-On', 15.0, 22.0, 14.0, 9.0), ('Briggs & Riley Baseline 22"', 15.0, 22.0, 14.0, 9.0), 
  ('Herschel Little America Backpack', 18.0, 19.0, 13.0, 7.0), ('Calpak Kaya Laptop Backpack', 15.0, 17.0, 13.0, 6.0), 
  ('Samsonite Checked Large', 50.0, 28.0, 20.0, 12.0), ('Away Bigger Carry-On', 15.0, 22.7, 14.7, 9.6), 
  ('Osprey Porter 46', 22.0, 22.0, 14.0, 10.0), ('Thule Subterra 34L', 20.0, 21.0, 14.0, 9.0), 
  ('Peak Design Travel Backpack 45L', 25.0, 22.0, 13.0, 11.0), ('Nomatic Travel Bag 40L', 20.0, 21.0, 14.0, 9.0), 
  ('Tom Bihn Aeronaut 45', 22.0, 22.0, 14.0, 9.0), ('Deuter Aviant 36', 20.0, 20.0, 13.0, 9.0), 
  ('Kelty Redwing 44', 22.0, 22.0, 14.0, 10.0), ('Gregory Mountain Zulu 40', 20.0, 21.0, 13.0, 9.0), 
  ('Pacsafe Venturesafe 45L', 25.0, 22.0, 14.0, 9.0), ('Victorinox Spectra 2.0 21"', 15.0, 21.0, 14.0, 9.0), 
  ('LuggageWorks Stealth 22"', 15.0, 22.0, 14.0, 9.0), ('RIMOWA Essential Lite 21"', 15.0, 21.5, 14.5, 9.0), 
  ('Monos Carry-On Pro', 15.0, 22.0, 14.0, 9.0), ('Samsonite Freeform 21"', 15.0, 21.0, 14.0, 9.0), 
  ('Osprey Ozone 35', 18.0, 19.0, 14.0, 8.0), ('Eagle Creek Global Companion 40L', 20.0, 22.0, 14.0, 9.0), 
  ('Travelpro Crew 11 21"', 15.0, 21.0, 14.0, 9.0), ('Delsey Chatelet 21"', 15.0, 21.0, 14.0, 9.0), 
  ('Away Checked Medium', 50.0, 26.0, 18.0, 11.0), ('Samsonite Winfield 3 28"', 50.0, 28.0, 20.0, 12.0), 
  ('North Face Rolling Thunder 22"', 15.0, 22.0, 14.0, 9.0), ('Patagonia Arbor 26L', 15.0, 18.0, 12.0, 7.0), 
  ('REI Co-op Ruckpack 40', 20.0, 21.0, 13.0, 9.0), ('Tortuga Setout 45L', 22.0, 22.0, 14.0, 9.0), 
  ('Fjällräven Splitpack 35L', 20.0, 20.0, 13.0, 8.0), ('Osprey Fairview 40', 20.0, 21.0, 14.0, 9.0), 
  ('Thule Crossover 32L', 18.0, 19.0, 13.0, 8.0), ('Hynes Eagle 38L', 18.0, 20.0, 13.0, 8.0), 
  ('Incase EO Travel Backpack', 15.0, 18.0, 13.0, 7.0), ('Timbuk2 Aviator 42L', 20.0, 21.0, 14.0, 9.0), 
  ('Everlane ReNew Transit Backpack', 15.0, 17.0, 12.0, 7.0), ('Samsonite Xenon 3 22"', 15.0, 22.0, 14.0, 9.0), 
  ('Away Checked Large', 50.0, 29.0, 20.5, 12.5), ('Travelpro Platinum Elite 25"', 50.0, 25.0, 18.0, 11.0), 
  ('Delsey Paris Clavel 25"', 50.0, 25.0, 17.0, 10.0), ('American Tourister Belle Voyage 25"', 50.0, 25.0, 18.0, 11.0), 
  ('Osprey Transporter 65', 30.0, 24.0, 16.0, 12.0), ('Patagonia Black Hole 55L', 25.0, 23.0, 15.0, 11.0), 
  ('North Face Base Camp Duffel M', 30.0, 23.0, 14.0, 14.0), ('REI Co-op Big Haul 60', 30.0, 25.0, 16.0, 12.0), 
  ('Eagle Creek Migrate Duffel 60', 30.0, 24.0, 15.0, 11.0), ('Thule Chasm 70L', 35.0, 25.0, 16.0, 12.0), 
  ('Samsonite Omni 24"', 50.0, 24.0, 17.0, 11.0), ('Away Carry-On Flex', 15.0, 21.7, 13.7, 9.0), 
  ('Monos Checked Medium', 50.0, 26.0, 18.0, 11.0), ('RIMOWA Classic Cabin', 15.0, 21.7, 15.8, 9.1), 
  ('Tumi Merge 22"', 15.0, 22.0, 14.0, 9.0), ('Briggs & Riley Torq 22"', 15.0, 22.0, 14.0, 9.0), 
  ('Osprey Sojourn 45', 25.0, 22.0, 14.0, 10.0), ('Peak Design Duffel 35L', 20.0, 22.0, 14.0, 9.0), 
  ('Nomatic Navigator 32L', 18.0, 20.0, 13.0, 8.0), ('Tom Bihn Tri-Star', 20.0, 21.0, 13.0, 8.0), 
  ('Deuter Transit 50', 25.0, 23.0, 15.0, 10.0), ('Kelty Redcloud 44', 22.0, 22.0, 14.0, 10.0), 
  ('Gregory Compass 40', 20.0, 21.0, 13.0, 9.0), ('Pacsafe EXP45', 25.0, 22.0, 14.0, 9.0), 
  ('Victorinox Connex 24"', 50.0, 24.0, 17.0, 11.0), ('LuggageWorks Aurora 26"', 50.0, 26.0, 18.0, 11.0), 
  ('Herschel Parcel 24"', 50.0, 24.0, 17.0, 11.0), ('Calpak Hue 26"', 50.0, 26.0, 18.0, 11.0), 
  ('Travelpro Bold 30"', 50.0, 30.0, 20.0, 12.0), ('Delsey Paris Sky Max 24"', 50.0, 24.0, 17.0, 11.0), 
  ('American Tourister Curio 25"', 50.0, 25.0, 18.0, 11.0), ('Osprey Arcane Duffel 30', 18.0, 20.0, 12.0, 8.0), 
  ('Patagonia Planing Duffel 40L', 20.0, 22.0, 14.0, 9.0), ('North Face Flyweight Duffel', 15.0, 20.0, 13.0, 8.0), 
  ('REI Co-op Roadtripper 40', 20.0, 21.0, 13.0, 9.0), ('Tortuga Outbreaker 35L', 20.0, 21.0, 13.0, 9.0), 
  ('Fjällräven Travel Pack', 20.0, 20.0, 13.0, 8.0), ('Osprey Daylite 40', 18.0, 19.0, 13.0, 8.0), 
  ('Thule Landmark 40L', 20.0, 21.0, 14.0, 9.0), ('Hynes Eagle 44L', 22.0, 22.0, 14.0, 10.0), 
  ('Incase Via Backpack 30L', 18.0, 19.0, 13.0, 7.0), ('Timbuk2 Wander Pack', 20.0, 21.0, 14.0, 9.0), 
  ('Everlane Mover Pack', 15.0, 18.0, 12.0, 7.0), ('Samsonite Tectonic 28"', 50.0, 28.0, 20.0, 12.0), 
  ('Away Everywhere Bag', 15.0, 20.5, 11.0, 7.0), ('Monos Metro Duffel', 15.0, 19.0, 12.0, 8.0), 
  ('RIMOWA Hybrid Cabin', 15.0, 21.7, 15.8, 9.1), ('Tumi Voyageur 22"', 15.0, 22.0, 14.0, 9.0);
