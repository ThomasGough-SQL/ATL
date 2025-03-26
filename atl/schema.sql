-- Create the passengers table
-- This table stores basic information about each passenger
CREATE TABLE passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- Unique ID for each passenger (auto-generated)
    first_name TEXT NOT NULL,               -- Passenger's first name (required)
    last_name TEXT NOT NULL,                -- Passenger's last name (required)
    age INTEGER                             -- Passenger's age (optional)
);

-- Create the check_ins table
-- This table records when passengers check in for their flights
CREATE TABLE check_ins (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- Unique ID for each check-in
    passenger_id INTEGER,                   -- Foreign key to the passengers table
    flight_number INTEGER,                  -- Foreign key to the flights table
    checkin_date TEXT NOT NULL,             -- The date of check-in (e.g., '2024-01-12')
    checkin_time TEXT NOT NULL,             -- The time of check-in (e.g., '08:45')
    FOREIGN KEY (passenger_id) REFERENCES passengers(id),
    FOREIGN KEY (flight_number) REFERENCES flights(number)
);

-- Create the airlines table
-- This table stores information about different airlines
CREATE TABLE airlines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- Unique ID for each airline
    name TEXT NOT NULL,                     -- Name of the airline (e.g., "Delta")
    concourse TEXT NOT NULL                 -- Concourse the airline operates from (e.g., "A", "B", etc.)
);

-- Create the flights table
-- This table tracks flights and their details
CREATE TABLE flights (
    number INTEGER PRIMARY KEY,             -- Flight number (unique across all flights)
    airline_id INTEGER,                     -- Foreign key to the airlines table
    departing TEXT NOT NULL,                -- Departure location (e.g., "JFK")
    arriving TEXT NOT NULL,                 -- Arrival location (e.g., "LAX")
    departure_date TEXT NOT NULL,           -- Departure date (e.g., '2024-04-01')
    departure_time TEXT NOT NULL,           -- Departure time (e.g., '13:30')
    arrival_date TEXT NOT NULL,             -- Arrival date (e.g., '2024-04-01')
    arrival_time TEXT NOT NULL,             -- Arrival time (e.g., '16:45')
    FOREIGN KEY (airline_id) REFERENCES airlines(id)
);
