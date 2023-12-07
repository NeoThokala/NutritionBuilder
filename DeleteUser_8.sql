DELIMITER $$
-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS DeleteUser;
-- Create the procedure
CREATE PROCEDURE DeleteUser(username varchar(100))
BEGIN
    -- Declare variables 
	DECLARE success BOOLEAN DEFAULT TRUE;
    DECLARE myuserid, foodlogexists, exerciselogexits INT;
    
    START TRANSACTION;
    
    -- get the id values for the names
    SELECT UserId INTO myuserid FROM Users WHERE Name = username limit 1;
    SELECT 1 INTO foodlogexists FROM UserFoodLog WHERE UserId = myuserid limit 1;
    SELECT 1 INTO exerciselogexits FROM UserExerciseLog WHERE UserId = myuserid limit 1;
    
    -- Perform the insert
    IF (myuserid is not null) THEN
		IF (foodlogexists is not null) THEN
			DELETE FROM UserFoodLog
            Where UserId = myuserid;
		END IF;
        IF (exerciselogexits is not null) THEN
			DELETE FROM UserExerciseLog
            Where UserId = myuserid;
		END IF;
		DELETE FROM Users 
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
