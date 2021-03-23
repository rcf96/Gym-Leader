-- 1.0
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

  

CREATE TABLE 3rd_Party_Login 

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

  Client/Trainer_UserID INT NOT NULL, 

  PRIMARY KEY (UserID), 

  FOREIGN KEY (Login_Id) REFERENCES 3rd_Party_Login(Login_Id), 

  FOREIGN KEY (Client/Trainer_UserID) REFERENCES Users(UserID) 

); 

  

CREATE TABLE Creates 

( 

  UserID INT NOT NULL, 

  Workout_ID INT NOT NULL, 

  PRIMARY KEY (UserID, Workout_ID), 

  FOREIGN KEY (UserID) REFERENCES Users(UserID), 

  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID) 

); 

  

CREATE TABLE Creates/View 

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

--1.1
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

--2.0
CREATE TABLE Workouts
(
  Name VARCHAR(255) NOT NULL,
  Length_of_Time INT NOT NULL,
  Type(Core,_Strength) VARCHAR(255) NOT NULL,
  Workout_ID INT SERIAL NOT NULL,
  PRIMARY KEY (Workout_ID)
);CREATE TABLE Exercises
(
  Repetitions INT NOT NULL,
  Sets INT NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Exercise_ID SERIAL NOT NULL,
  PRIMARY KEY (Exercise_ID)
);CREATE TABLE Third_Party_Login
(
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Login_Token SERIAL NOT NULL,
  PRIMARY KEY (Login_Token)
);CREATE TABLE Feedback
(
  Comments VARCHAR(255) NOT NULL,
  Comment_ID INT SERIAL NOT NULL,
  PRIMARY KEY (Comment_ID)
);CREATE TABLE Users
(
  Role INT NOT NULL,
  UserID SERIAL NOT NULL,
  Verified INT,
  isAdmin INT NOT NULL,
  Trainer INT,
  Login_Token INT NOT NULL,
  PRIMARY KEY (UserID),
  FOREIGN KEY (Login_Token) REFERENCES Third_Party_Login(Login_Token)
);CREATE TABLE AssignedWorkout
(
  DateDue DATE NOT NULL,
  AssignedID SERIAL NOT NULL,
  UserID INT NOT NULL,
  Workout_ID INT NOT NULL,
  PRIMARY KEY (AssignedID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID)
);CREATE TABLE Creates
(
  UserID INT NOT NULL,
  Workout_ID INT NOT NULL,
  PRIMARY KEY (UserID, Workout_ID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID)
);CREATE TABLE Has
(
  Workout_ID INT NOT NULL,
  Exercise_ID INT NOT NULL,
  PRIMARY KEY (Workout_ID, Exercise_ID),
  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID),
  FOREIGN KEY (Exercise_ID) REFERENCES Exercises(Exercise_ID)
);CREATE TABLE CreatesViews
(
  UserID INT NOT NULL,
  Comment_ID SERIAL NOT NULL,
  PRIMARY KEY (UserID, Comment_ID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (Comment_ID) REFERENCES Feedback(Comment_ID)
);CREATE TABLE Users_Clients
(
  Clients INT NOT NULL,
  UserID INT NOT NULL,
  PRIMARY KEY (Clients, UserID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);]

--2.1
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

--version 0
CREATE TABLE Workouts 

( 

  Name INT NOT NULL, 

  Length_of_Time INT NOT NULL, 

  Type_(Core,_Strength) INT NOT NULL, 

  Workout_ID SERIAL NOT NULL, 

  PRIMARY KEY (Workout_ID) 

); 

  

CREATE TABLE Exercises 

( 

  Repetitions INT NOT NULL, 

  Sets INT NOT NULL, 

  Description INT NOT NULL, 

  Exercise_ID SERIAL NOT NULL, 

  PRIMARY KEY (Exercise_ID) 

); 

  

CREATE TABLE 3rd_Party_Login 

( 

  Name INT NOT NULL, 

  Email INT NOT NULL, 

  Login_Token INT NOT NULL,

  Login_Id SERIAL NOT NULL, 

  PRIMARY KEY (Login_Id) 

); 

  

CREATE TABLE Feedback 

( 

  Comments INT NOT NULL, 

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

  Login_Token INT NOT NULL, 

  Client/Trainer_UserID INT NOT NULL, 

  PRIMARY KEY (UserID), 

  FOREIGN KEY (Login_Token) REFERENCES 3rd_Party_Login(Login_Token), 

  FOREIGN KEY (Client/Trainer_UserID) REFERENCES Users(UserID) 

); 

  

CREATE TABLE Creates 

( 

  UserID INT NOT NULL, 

  Workout_ID INT NOT NULL, 

  PRIMARY KEY (UserID, Workout_ID), 

  FOREIGN KEY (UserID) REFERENCES Users(UserID), 

  FOREIGN KEY (Workout_ID) REFERENCES Workouts(Workout_ID) 

); 

  

CREATE TABLE Creates/View 

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

--views 1.0
SELECT users_clients.clients,
    users.userid
   FROM (users_clients
     FULL JOIN users ON ((users.userid = users_clients.userid)))
  WHERE (users.role = 1);

SELECT assignedworkout.datedue,
    workouts.name,
    workouts.length_of_time
   FROM (workouts
     FULL JOIN assignedworkout ON ((workouts.workout_id = assignedworkout.workout_id)));

SELECT third_party_login.name,
    users.userid
   FROM (third_party_login
     FULL JOIN users ON ((users.login_token = third_party_login.login_token)));

SELECT assignedworkout.datedue,
    assignedworkout.assignedid,
    assignedworkout.userid,
    assignedworkout.workout_id
   FROM (assignedworkout
     LEFT JOIN users ON ((users.userid = assignedworkout.userid)));