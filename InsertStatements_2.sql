Insert into Goal (GoalType) 
Values ('Lose weight'), ('Gain weight'), ('maintain weight');

Insert into Users (Name, Age, Weight, HeightInches, Gender, GoalId)
Values ('Dawson', 35, 180, 78, 'Male', 2),
('Christopher', 28, 300, 74, 'Male', 1),
('Blake', 48, 240, 72, 'Male', 1),
('Carly', 22, 170, 65, 'Female', 1),
('Kimberly', 28, 120, 68, 'Female', 2),
('Journee', 32, 130, 67, 'Female', 3),
('Chloe', 44, 150, 64, 'Female', 1),
('Warren', 18, 300, 74, 'Male', 1),
('Claire', 35, 140, 65, 'Female', 3),
('Aleena', 30, 170, 66, 'Female', 1),
('Sean', 25, 300, 75, 'Male', 1);

Insert into Meal (MealType)
Values ('Breakfast'), 
('Mid-morning snack'),
('Lunch'),
('Mid-afternoon snack'),
('Dinner');

Insert into Exercise (ExerciseType, CaloriesBurnt)
Values ('Pilates', 200),
('Yoga', 100),
('Running', 300),
('Functional Training', 300),
('Strength Training', 250),
('Bicycle', 200),
('Walking', 200);

Insert into FoodCategory (CategoryName)
Values ('Vegetarian'),
('Non-Vegetarian');

Insert into Food (FoodName, Calories, Protien, Carbs, Fat, FoodCategoryId)
Values ('BlackCoffee', 0, 0, 0, 1, 1),
('pecans', 67, 1, 1, 7, 1),
('Beef', 360, 10, 70, 20, 2),
('Orange', 14, 1, 3, 0, 1),
('Cauliflower', 25, 2, 5, 0, 1),
('Lamb', 282, 17, 0, 23, 2),
('Cheese', 100, 6, 1, 24, 1),
('Vegetarian fillets', 290, 23, 9, 18, 1),
('Mango', 51, 0, 13, 0, 1),
('Crackers', 150, 6, 72, 7, 1),
('Chicken', 215, 15, 0, 14, 2),
('Pie', 00, 3, 42, 16, 1),
('Pasta', 371, 13, 74, 1, 1),
('Broccoli', 30, 1, 4, 0, 1),
('Lentils', 106, 9, 22, 1, 1),
('Bread', 100, 4, 10, 3, 1),
('egg', 70, 6, 1, 3, 2);
