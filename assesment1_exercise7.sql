CREATE TABLE CW1_TrailLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    TrailID INT NOT NULL,
    AddedBy INT NOT NULL,
    AddedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Log_Trail FOREIGN KEY (TrailID) REFERENCES CW1_Trail(TrailID),
    CONSTRAINT FK_Log_User FOREIGN KEY (AddedBy) REFERENCES CW1_User(UserID)
);

CREATE TRIGGER CW1_LogTrailInsert
ON CW1_Trail
AFTER INSERT
AS
BEGIN
    INSERT INTO CW1_TrailLog (TrailID, AddedBy)
    SELECT TrailID, UserID
    FROM inserted;
END;

EXEC CW1_AddTrail
    @TrailName = 'Trigger Test Trail',
    @Address = 'Trigger Location',
    @Length = 4.2,
    @Elevation = 80,
    @Duration = 90,
    @Summary = 'Trail to test trigger logging',
    @UserID = 3,
    @DifficultyCode = 'Hard',
    @RouteTypeCode = 'Loop';

SELECT * FROM CW1_Trail;
SELECT * FROM CW1_TrailLog;