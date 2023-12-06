DELIMITER $$
-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS AddUserInfo;
-- Create the procedure
CREATE PROCEDURE AddUserInfo(username varchar(100), userage int, userweight decimal(5,2), height int, usergender varchar(20), goal varchar(50))
BEGIN
	-- Declare variables to hold diagnostics area information
	DECLARE success BOOLEAN DEFAULT TRUE;
    DECLARE usergoalid, myuserid int;
    
    START TRANSACTION;
    
    -- get the id values for the names
    SELECT GoalId INTO usergoalid FROM Goal WHERE GoalType = goal;
    
    SELECT UserId INTO myuserid FROM Users WHERE Name = username;
    
    -- Perform the insert
    IF (myuserid is null) THEN
		INSERT INTO Users (Name, Age, Weight, HeightInches, Gender, GoalId)  
		VALUES (username, userage, userweight, height, usergender, usergoalid);
	ELSE
		UPDATE Users
			SET Age = userage,
				Weight = userweight,
                HeightInches = height,
                Gender = usergender,
                GoalId = usergoalid
		WHERE UserId = myuserid;
	END IF;
    
	  -- Check whether the insert was successful
	  IF ROW_COUNT() > 0 THEN
		COMMIT;
	  ELSE
		SET success = FALSE;
	  END IF;
      
      IF NOT success THEN
        -- Rollback the transaction if not successful
        ROLLBACK;
     END IF;
  
END$$

DELIMITER ;