DELIMITER $$
-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS AnalyticalReport;
-- Create the procedure
CREATE PROCEDURE AnalyticalReport()
BEGIN

    -- produce the Analytical Report
    SELECT U.Name, Sum(F.Calories) AS ConsumedCals, Sum(E.CaloriesBurnt) AS CalsBurnt
    FROM Users U
	JOIN UserFoodLog UFL ON UFL.UserId = U.UserId
	JOIN UserExerciseLog UEL ON UFL.UserId = U.UserId
	JOIN Food F ON F.FoodId = UFL.FoodId
	JOIN Exercise E ON E.ExerciseId = UEL.ExerciseId
    GROUP BY U.Name
    ORDER BY U.Name;
    
END$$

DELIMITER ;