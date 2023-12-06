DELIMITER $$
-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS InsertUserExerciseLog;
-- Create the procedure
CREATE PROCEDURE InsertUserExerciseLog(username varchar(100), myexercisetype varchar(100))
BEGIN
	-- Declare variables 
	DECLARE success BOOLEAN DEFAULT TRUE;
    DECLARE myuserid, myexerciseid int;
    
    START TRANSACTION;
    
    -- get the id values for the names
    SELECT UserId INTO myuserid FROM Users WHERE Name = username;
    
    SELECT ExerciseId INTO myexerciseid FROM Exercise WHERE ExerciseType = myexercisetype;
    
    -- Perform the insert
	INSERT INTO UserExerciseLog (UserId, ExerciseId, TimeExercised) 
    VALUES (myuserid, myexerciseid, current_timestamp());
    
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