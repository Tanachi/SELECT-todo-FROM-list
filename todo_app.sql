DROP USER IF EXISTS Michael;
CREATE USER Michael WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;
GRANT ALL ON DATABASE todo_app TO Michael;
CREATE TABLE tasks(
  id SERIAL,
  title varcha(255) NOT NULL,
  description text,
  created_at timestamp DEFAULT now(),
  updated_at timestamp,
  completed boolean DEFAULT false;
);
ALTER TABLE tasks ADD PRIMARY KEY(id);
ALTER TABLE tasks DROP IF EXISTS completed;
ALTER TABLE tasks ADD completed_at timestamp DEFAULT NULL;
