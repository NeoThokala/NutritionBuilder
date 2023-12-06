CREATE DATABASE NeoFitness;

CREATE TABLE Goal (
	GoalId int NOT NULL auto_increment,
    GoalType varchar(50),
    PRIMARY KEY (GoalId)
);

/* Unique Index for GoalType */
CREATE UNIQUE INDEX uidx_GoalType ON Goal (GoalType);

/* I used a separate table for Goal instead of adding it to the user table as the user goals could change anytime */
CREATE TABLE Users (
   UserId int NOT NULL auto_increment,
   Name varchar(100),
   Age int,
   Weight decimal(5,2),
   HeightInches int,
   Gender varchar(20),
   GoalId int,
   PRIMARY KEY (UserId),
   FOREIGN KEY (GoalId) REFERENCES Goal (GoalId)
);

CREATE TABLE FoodCategory (
	FoodCategoryId int NOT NULL auto_increment,
    CategoryName varchar(20),
    PRIMARY KEY (FoodCategoryId)
);

/* Unique Index on CategoryName column */
CREATE UNIQUE INDEX uidx_CategoryNAme ON FoodCategory (CategoryName);

/* I used a seperate table for FoodCategory, as a single food item could be categorized to Vegan or vegetarian if required */
CREATE TABLE Food (
	FoodId int NOT NULL auto_increment,
    FoodName varchar(255),
    Calories int,
    Protien int,
    Carbs int,
    Fat int,
    FoodCategoryId int,
    PRIMARY KEY (FoodId),
    FOREIGN KEY (FoodCategoryId) REFERENCES FoodCategory (FoodCategoryId)
);

/* Unique Index on FoodName */
CREATE UNIQUE INDEX uidx_FoodName ON Food (FoodName);

CREATE TABLE Meal (
	MealId int NOT NULL auto_increment,
    MealType varchar(20),
    PRIMARY KEY (MealId)
);

/* Unique Index for MealType */
CREATE UNIQUE INDEX uidx_MealType ON Meal (MealType);

/* Used MealId in this table, as the same Food item could be part of a different meal */
CREATE TABLE UserFoodLog (
	FoodLogId int NOT NULL auto_increment,
    UserId int,
    FoodId int,
    MealId int,
    TimeConsumed datetime,
	PRIMARY KEY (FoodLogId),
    FOREIGN KEY (UserId) REFERENCES Users (UserId),
    FOREIGN KEY (FoodId) REFERENCES Food (FoodId),
    FOREIGN KEY (MealId) REFERENCES Meal (MealId)
);

CREATE TABLE Exercise (
	ExerciseId int NOT NULL auto_increment,
    ExerciseType varchar(100),
    CaloriesBurnt int,
    PRIMARY KEY (ExerciseId)
);

/* Unique Index for ExerciseType */
CREATE UNIQUE INDEX uidx_ExerciseType ON Exercise (ExerciseType);

CREATE TABLE UserExerciseLog (
	ExerciseLogId int NOT NULL auto_increment,
    UserId int,
    ExerciseId int,
    TimeExercised datetime,
    PRIMARY KEY (ExerciseLogId),
    FOREIGN KEY (UserId) REFERENCES Users (UserId),
    FOREIGN KEY (ExerciseId) REFERENCES Exercise (ExerciseId)
);