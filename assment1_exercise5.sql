CREATE VIEW CW1_TrailSummary AS
SELECT
    t.TrailID,
    t.TrailName,
    t.Summary,
    t.Length,
    t.Elevation,
    t.Duration,
    d.DifficultyCode,
    d.DifficultyIcon,
    r.RouteTypeCode,
    r.RouteTypeIcon,
    u.Username AS Owner
FROM CW1_Trail t
JOIN CW1_Difficulty d ON t.DifficultyCode = d.DifficultyCode
JOIN CW1_RouteType r ON t.RouteTypeCode = r.RouteTypeCode
JOIN CW1_User u ON t.UserID = u.UserID;

SELECT * FROM CW1_TrailSummary;