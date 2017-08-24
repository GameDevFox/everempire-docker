CREATE TABLE "user" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  email VARCHAR(256)
);

CREATE TABLE auth (
  id SERIAL PRIMARY KEY,
  provider VARCHAR(16) NOT NULL,
  provider_uid VARCHAR(32) NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES "user"(id),
  UNIQUE (provider, provider_uid)
);

CREATE TABLE token (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(64) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE world (
  id SERIAL PRIMARY KEY,
  name VARCHAR(32) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES "user"(id)
);

