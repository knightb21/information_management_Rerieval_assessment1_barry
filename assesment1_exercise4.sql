CREATE TABLE CW1_User (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE CW1_Difficulty (
    DifficultyCode VARCHAR(20) PRIMARY KEY,
    DifficultyIcon VARCHAR(100) NOT NULL
);

CREATE TABLE CW1_RouteType (
    RouteTypeCode VARCHAR(20) PRIMARY KEY,
    RouteTypeIcon VARCHAR(100) NOT NULL
);

CREATE TABLE CW1_Trail (
    TrailID INT IDENTITY(1,1) PRIMARY KEY,
    TrailName VARCHAR(200) NOT NULL,
    Address VARCHAR(200),
    Length DECIMAL(10,2) CHECK (Length > 0),
    Elevation INT CHECK (Elevation >= 0),
    Duration INT NOT NULL CHECK (Duration > 0), -- minutes
    Summary VARCHAR(500),
    UserID INT NOT NULL,
    DifficultyCode VARCHAR(20) NOT NULL,
    RouteTypeCode VARCHAR(20) NOT NULL,
);

INSERT INTO CW1_User (Username) VALUES ('Peter Chan');
INSERT INTO CW1_User (Username) VALUES ('Bruce Lee');
INSERT INTO CW1_User (Username) VALUES ('Andy Lau');

INSERT INTO CW1_Difficulty VALUES ('Easy', 'easy');
INSERT INTO CW1_Difficulty VALUES ('Moderate', 'moderate');
INSERT INTO CW1_Difficulty VALUES ('Hard', 'hard');

INSERT INTO CW1_RouteType VALUES ('Loop', 'loop_icon');
INSERT INTO CW1_RouteType VALUES ('Point-to-Point', 'point_icon');

INSERT INTO CW1_Trail (TrailName, Address, Length, Elevation, Duration, Summary, UserID, DifficultyCode, RouteTypeCode)
VALUES ('Plymbridge Circular', 'Plymouth, Devon', 8.50, 120, 180, 'A scenic circular trail along Plymbridge woods.', 1, 'Moderate', 'Loop');

INSERT INTO CW1_Trail (TrailName, Address, Length, Elevation, Duration, Summary, UserID, DifficultyCode, RouteTypeCode)
VALUES ('Waterfront Walk', 'Plymouth Waterfront', 5.00, 50, 90, 'Easy walk along the waterfront.', 2, 'Easy', 'Point-to-Point');

SELECT * FROM CW1_User;
SELECT * FROM CW1_Difficulty;
SELECT * FROM CW1_RouteType;
SELECT * FROM CW1_Trail;