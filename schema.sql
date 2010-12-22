CREATE TABLE Game (
		ID INTEGER PRIMARY KEY,
		name TEXT,
		info TEXT,
		image BLOB,
		image_header TEXT,
		license TEXT,
		url TEXT,
		num_of_downloads INTEGER,
		rating INTEGER 
		);

CREATE TABLE Tag (
		ID INTEGER PRIMARY KEY, 
		name TEXT
		);

CREATE TABLE GamesTag(
		ID INT NOT NULL UNIQUE PRIMARY KEY,
		gameID INT NOT NULL CONSTRAINT fk_games_id REFERENCES Game(ID),
		tagID  INT NOT NULL CONSTRAINT fk_tag_id REFERENCES Tag(ID)
	);
