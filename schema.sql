-- Create a Item class table
CREATE TABLE Item (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre TEXT,
  author TEXT,
  source TEXT,
  label TEXT,
  archived BOOLEAN,
  publish_date DATE
);

-- Create a Book class table
CREATE TABLE Book (
  publisher CHAR,
  cover_state CHAR,
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  archived BOOLEAN
);

-- Create a Game class table
CREATE TABLE Game (
  multiplayer VARCHAR,
  last_played_at DATE,
  id SERIAL PRIMARY KEY ,
  item_id INT FOREIGN KEY REFERENCES item(id),
  publish_date DATE,
  archived BOOLEAN
);

-- Create a Music Album class table
CREATE TABLE Music_Album (
  on_spotify BOOLEAN,
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  archived BOOLEAN,
  publish_date DATE
);

-- Create a Movie class table
CREATE TABLE Movie (
  silet BOOLEAN,
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  archived BOOLEAN,
  publish_date DATE
);

-- Create a Label class table
CREATE TABLE Label (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title TEXT,
	color TEXT,
    item_id INT FOREIGN KEY REFERENCES item(id)
);



-- Create an Author class table
CREATE TABLE Author (
	id SERIAL PRIMARY KEY,
	first_name NAME,
	last_name NAME,
    item_id INT FOREIGN KEY REFERENCES item(id),
);



-- Create a Genre class table
CREATE TABLE Genre (
  id SERIAL PRIMARY KEY,
  name NAME
  item_id INT FOREIGN KEY REFERENCES item(id),
);

-- Create a Source class table
CREATE TABLE Source (
  id SERIAL PRIMARY KEY,
  name NAME
  item_id INT FOREIGN KEY REFERENCES item(id),
);
