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
ALTER TABLE tasks ALTER updated_at SET DEFAULT now();
ALTER TABLE tasks ALTER updated_at SET NOT NULL;
INSERT INTO tasks(title, description, created_at, updated_at, completed_at)
  VALUES('STUDY SQL', 'Complete this exersise', now(), now());
INSERT INTO tasks(title, description) VALUES ('Study Postgresql', 'Read all the documentation');
SELECT * FROM tasks WHERE completed_at = NULL;
UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';
