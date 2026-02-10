-- Diseases table
CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT
);

-- Treatments table
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  disease_id INTEGER REFERENCES diseases(id) ON DELETE CASCADE,
  treatment TEXT NOT NULL
);

-- Predictions table
CREATE TABLE predictions (
  id SERIAL PRIMARY KEY,
  disease_id INTEGER REFERENCES diseases(id),
  confidence FLOAT NOT NULL,
  image_path TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(150) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
