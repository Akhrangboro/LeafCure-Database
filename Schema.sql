REATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(150) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================
-- DISEASES (what disease is)
-- =========================
CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) UNIQUE NOT NULL,
  description TEXT
);


-- =========================
-- DISEASE CONDITIONS (when it happens)
-- =========================
CREATE TABLE disease_conditions (
  id SERIAL PRIMARY KEY,
  disease_id INT REFERENCES diseases(id) ON DELETE CASCADE,

  min_temperature FLOAT,
  max_temperature FLOAT,

  min_humidity FLOAT,
  max_humidity FLOAT,

  season VARCHAR(100),          -- Winter / Monsoon / Summer / Rainy
  rainfall_level VARCHAR(100),  -- optional but useful

  notes TEXT
);


-- =========================
-- TREATMENTS (how to cure)
-- =========================
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  disease_id INT REFERENCES diseases(id) ON DELETE CASCADE,

  medicine VARCHAR(150) NOT NULL,
  dosage VARCHAR(100),
  frequency VARCHAR(100),

  notes TEXT
);


-- =========================
-- PREDICTIONS (user history)
-- =========================
CREATE TABLE predictions (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  disease_id INT REFERENCES diseases(id),

  confidence FLOAT NOT NULL,
  image_path TEXT,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

