DELIMITER $$
-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS InsertUserFoodLog;
-- Create the procedure
CREATE PROCEDURE InsertUserFoodLog(username varchar(100), fname varchar(255), meal varchar(20))
BEGIN
	-- Declare variables 
	DECLARE success BOOLEAN DEFAULT TRUE;
    DECLARE myuserid, mymealid, myfoodid int;
    
    START TRANSACTION;
    
    -- get the id values for the names
    SELECT UserId INTO myuserid FROM Users WHERE Name = username LIMIT 1;
    
    SELECT FoodId INTO myfoodid FROM Food WHERE FoodName = fname LIMIT 1;
    
    SELECT MealId INTO mymealid FROM Meal WHERE MealType = meal LIMIT 1;
    
    -- Perform the insert
	INSERT INTO UserFoodLog (UserId, FoodId, MealId, TimeConsumed) 
    VALUES (myuserid, myfoodid, mymealid, current_timestamp());

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
