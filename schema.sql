CREATE DATABASE social_app;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(300),
  lastname VARCHAR(300),
  email VARCHAR(300),
  password_digest VARCHAR(300)
);

CREATE TABLE tweets (
  user_id INTEGER NOT NULL,
  content TEXT,
  created_at timestamptz NOT NULL DEFAULT now()
);