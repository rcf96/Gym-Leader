CREATE TABLE Workouts 

( 

  Name TEXT NOT NULL, 

  Length_of_Time INT NOT NULL, 

  Type_(Core,_Strength) TEXT NOT NULL, 

  Workout_ID SERIAL NOT NULL, 

  PRIMARY KEY (Workout_ID) 

); 

  

CREATE TABLE Exercises 

( 

  Repetitions INT NOT NULL, 

  Sets INT NOT NULL, 

  Description TEXT NOT NULL, 

  Exercise_ID SERIAL NOT NULL, 

  PRIMARY KEY (Exercise_ID) 

); 

  

CREATE TABLE third_Party_Login 

( 

  Name TEXT NOT NULL, 

  Email TEXT NOT NULL, 

  Login_Token VARCHAR NOT NULL,

  Login_Id SERIAL NOT NULL, 

  PRIMARY KEY (Login_Id) 

); 

  

CREATE TABLE Feedback 

( 

  Comments TEXT NOT NULL, 

  Comment_ID SERIAL NOT NULL, 

  PRIMARY KEY (Comment_ID) 

); 

  

CREATE TABLE Workout_Exercises 

( 

  Workout_ID INT NOT NULL, 

  Exercise_ID INT NOT NULL, 

  PRIMARY KEY (Workout_ID, Exercise_ID), 

  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID), 

  FOREIGN KEY (Exercise_ID) REFERENCES Exercises(Exercise_ID) 

); 

  

CREATE TABLE Users 

( 

  Role INT NOT NULL, 

  UserID SERIAL NOT NULL, 

  Verified INT, 

  isAdmin INT NOT NULL, 

  Trainer INT, 

  Login_Id INT NOT NULL, 

  ClientTrainer_UserID INT NOT NULL, 

  PRIMARY KEY (UserID), 

  FOREIGN KEY (Login_Id) REFERENCES third_Party_Login(Login_Id), 

  FOREIGN KEY (ClientTrainer_UserID) REFERENCES Users(UserID) 

); 

  

CREATE TABLE Creates 

( 

  UserID INT NOT NULL, 

  Workout_ID INT NOT NULL, 

  PRIMARY KEY (UserID, Workout_ID), 

  FOREIGN KEY (UserID) REFERENCES Users(UserID), 

  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID) 

); 

  

CREATE TABLE CreatesView 

( 

  UserID INT NOT NULL, 

  Comment_ID INT NOT NULL, 

  PRIMARY KEY (UserID, Comment_ID), 

  FOREIGN KEY (UserID) REFERENCES Users(UserID), 

  FOREIGN KEY (Comment_ID) REFERENCES Feedback(Comment_ID) 

); 

  

CREATE TABLE Users_Clients 

( 

  Clients INT NOT NULL, 

  UserID INT NOT NULL, 

  PRIMARY KEY (Clients, UserID), 

  FOREIGN KEY (UserID) REFERENCES Users(UserID) 

); 