CREATE PROCEDURE CW1_AddTrail
    @TrailName VARCHAR(200),
    @Address VARCHAR(200),
    @Length DECIMAL(10,2),
    @Elevation INT,
    @Duration INT,
    @Summary VARCHAR(500),
    @UserID INT,
    @DifficultyCode VARCHAR(20),
    @RouteTypeCode VARCHAR(20)
AS
BEGIN
    INSERT INTO CW1_Trail (TrailName, Address, Length, Elevation, Duration, Summary, UserID, DifficultyCode, RouteTypeCode)
    VALUES (@TrailName, @Address, @Length, @Elevation, @Duration, @Summary, @UserID, @DifficultyCode, @RouteTypeCode);
END;

EXEC CW1_AddTrail
    @TrailName = 'Test Trail',
    @Address = 'Test Location',
    @Length = 6.5,
    @Elevation = 100,
    @Duration = 120,
    @Summary = 'Test summary',
    @UserID = 1,
    @DifficultyCode = 'Easy',
    @RouteTypeCode = 'Loop';


CREATE PROCEDURE CW1_ReadTrail
    @TrailID INT
AS
BEGIN
    SELECT * FROM CW1_Trail WHERE TrailID = @TrailID;
END;

EXEC CW1_ReadTrail @TrailID = 1;

CREATE PROCEDURE CW1_UpdateTrail
    @TrailID INT,
    @TrailName VARCHAR(200),
    @Address VARCHAR(200),
    @Length DECIMAL(10,2),
    @Elevation INT,
    @Duration INT,
    @Summary VARCHAR(500),
    @UserID INT,
    @DifficultyCode VARCHAR(20),
    @RouteTypeCode VARCHAR(20)
AS
BEGIN
    UPDATE CW1_Trail
    SET TrailName = @TrailName,
        Address = @Address,
        Length = @Length,
        Elevation = @Elevation,
        Duration = @Duration,
        Summary = @Summary,
        UserID = @UserID,
        DifficultyCode = @DifficultyCode,
        RouteTypeCode = @RouteTypeCode
    WHERE TrailID = @TrailID;
END;

EXEC CW1_UpdateTrail
    @TrailID = 1,
    @TrailName = 'Updated Trail',
    @Address = 'Updated Address',
    @Length = 7.2,
    @Elevation = 150,
    @Duration = 140,
    @Summary = 'Updated summary',
    @UserID = 2,
    @DifficultyCode = 'Moderate',
    @RouteTypeCode = 'Point-to-Point';

CREATE PROCEDURE CW1_DeleteTrail
    @TrailID INT
AS
BEGIN
    DELETE FROM CW1_Trail WHERE TrailID = @TrailID;
END;

EXEC CW1_DeleteTrail @TrailID = 1;





