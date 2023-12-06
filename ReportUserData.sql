DELIMITER $$
-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS ReportUserData;
-- Create the procedure
CREATE PROCEDURE ReportUserData(username varchar(100))
BEGIN
	
    DECLARE result TEXT;
    DECLARE calorieNeed, foodcal, exercisecal INT;
    
    SELECT CASE WHEN Gender = 'Female' THEN (655 + (9 * Weight/2) + (4 * HeightInches) - (5 * Age)) 
				ELSE (66 + (14 * Weight/2) + (10 * HeightInches) - (7 * Age)) END INTO calorieNeed
    FROM Users
    WHERE Name = username;
    
    -- Create a temporary table to store the result of the second SELECT
    CREATE TEMPORARY TABLE temp_report
    (
        report TEXT
    );

    -- Insert the report into the temporary table
    INSERT INTO temp_report
    SELECT CONCAT('Welcome ', username, ' your daily calorie needs are ', calorieNeed, ' calories and you have eaten ', 
			IFNULL(Sum(F.Calories), ''), ' today and burnt ', IFNULL(Sum(E.CaloriesBurnt), ''),
			CASE WHEN SUM(F.Calories) > SUM(E.CaloriesBurnt) THEN '. You need to put in more effort. Keep trying!'
						ELSE '. Great work! you are a step closer to your goal.' END) AS report
    FROM Users U
	JOIN UserFoodLog UFL ON UFL.UserId = U.UserId
	JOIN UserExerciseLog UEL ON UFL.UserId = U.UserId
	JOIN Food F ON F.FoodId = UFL.FoodId
	JOIN Exercise E ON E.ExerciseId = UEL.ExerciseId
    WHERE U.Name = username
    AND UFL.TimeConsumed BETWEEN DATE_SUB(current_timestamp(), INTERVAL 1 DAY) AND current_timestamp()  
    AND UEL.TimeExercised BETWEEN DATE_SUB(current_timestamp(), INTERVAL 1 DAY) AND current_timestamp();
    
    -- Fetch the result from the temporary table
    SELECT report FROM temp_report;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_report;

END$$

DELIMITER ;