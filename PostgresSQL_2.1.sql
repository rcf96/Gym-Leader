CREATE TABLE Workouts
(
  Name VARCHAR(255) NOT NULL,
  Length_of_Time INT NOT NULL,
  Type_(Core,_Strength) VARCHAR(255) NOT NULL,
  Workout_ID SERIAL NOT NULL,
  PRIMARY KEY (Workout_ID)
);

CREATE TABLE Exercises
(
  Repetitions INT NOT NULL,
  Sets INT NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Exercise_ID SERIAL NOT NULL,
  PRIMARY KEY (Exercise_ID)
);

CREATE TABLE Third_Party_Login
(
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Login_Token INT NOT NULL,
  PRIMARY KEY (Login_Token)
);

CREATE TABLE Feedback
(
  Comments VARCHAR(255) NOT NULL,
  Comment_ID SERIAL NOT NULL,
  TimeStamp DATE NOT NULL,
  PRIMARY KEY (Comment_ID)
);

CREATE TABLE Users
(
  Role INT NOT NULL,
  UserID SERIAL NOT NULL,
  Verified INT,
  isAdmin INT NOT NULL,
  Trainer INT,
  Login_Token INT NOT NULL,
  PRIMARY KEY (UserID),
  FOREIGN KEY (Login_Token) REFERENCES Third_Party_Login(Login_Token)
);

CREATE TABLE AssignedWorkout
(
  DateDue DATE NOT NULL,
  AssignedID SERIAL NOT NULL,
  UserID INT NOT NULL,
  Workout_ID INT NOT NULL,
  PRIMARY KEY (AssignedID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID)
);

CREATE TABLE Creates
(
  UserID INT NOT NULL,
  Workout_ID INT NOT NULL,
  PRIMARY KEY (UserID, Workout_ID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID)
);

CREATE TABLE Has
(
  Workout_ID INT NOT NULL,
  Exercise_ID INT NOT NULL,
  PRIMARY KEY (Workout_ID, Exercise_ID),
  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID),
  FOREIGN KEY (Exercise_ID) REFERENCES Exercises(Exercise_ID)
);

CREATE TABLE Creates/View
(
  UserID INT NOT NULL,
  Comment_ID SERIAL NOT NULL,
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