CREATE DATABASE Storiess;
USE Storiess;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    LastLoginDate DATETIME
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    UserID INT,
    Username VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Stories (
    StoryID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    CoverImage VARCHAR(255),
    Genre VARCHAR(60),
    Numberofchps INT,
    AuthorID INT, 
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Chapters (
    ChapterID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ChapterNo INT,
    Content TEXT,
    StoryID INT,
    FOREIGN KEY (StoryID) REFERENCES Stories(StoryID)
);

CREATE TABLE Bookmark (
    LibraryID INT PRIMARY KEY,
    UserID INT,
    StoryID INT,
    DateAdded DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (StoryID) REFERENCES Stories(StoryID)
);

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY,
    Content TEXT,
    CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    UserID INT,
    StoryID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (StoryID) REFERENCES Stories(StoryID)
);

INSERT INTO Users (UserID, Username, Email, Password, RegistrationDate, LastLoginDate)
VALUES (1, 'ashka', 'ashka@gmail.com', 'pass1234@', '2022-01-01 08:00:00', '2022-01-02 12:00:00'),
       (2, 'siddhi', 'siddhi@gmail.com', 'securepass', '2022-01-05 10:00:00', '2022-01-06 15:00:00'),
       (3, 'aadit khanolkar', 'aadit@gmail.com', 'passpass', '2022-01-05 10:30:00', '2022-01-06 15:45:00'),
       (4, 'laddoo', 'laddoo@gmail.com', 'laddoooo', '2022-04-05 10:30:00', '2022-11-07 14:05:00');
       
INSERT INTO Authors (AuthorID, UserID, Username)
VALUES (1, 3, 'aadit khanolkar'),
       (2, 2, 'siddhi kadam'),
       (3, 1, 'ashka'),
       (4, 4, 'laddoo');

INSERT INTO Stories (StoryID, Title, Description, CoverImage, Numberofchps, AuthorID, Genre)
VALUES (1, 'Dead Shot', 'Working as a journalist at a small weekly paper in rural Idaho, Cal Murphy begins losing his big city dreams of writing for a metro paper before his passion is reignited after three high school star athletes are found dead in a 24-hour period. ', 'dead_shot.jpg', 68, 1, 'Thriller'),
       (2, 'The Whole Truth', "Adele knows she witnessed a murder - what she doesn't know is just how personal it is.", 'the_whole_truth.jpg', 51, 2, 'Murder Mystery'),
	   (3, 'Paradise Thriller', "Alison's sister disappeared filming a reality show, so she goes undercover as a contestant, discovering that in some cases reality tv is all too real. ", 'paradise_thriller.jpg', 54, 3, 'Psychological'),
	   (4, 'Dead If You Do', "A campus thriller: suspense, murder & one handsome roommate.", 'dead_if_you_do.jpg', 52, 4, 'Crime');
       
INSERT INTO Chapters (ChapterID, Title, ChapterNo, Content, StoryID)
VALUES (1, "Chapter 1: The Disappearance", 1, "Cal Murphy investigates the mysterious disappearances in rural Idaho.", 1),
       (2, "Chapter 2: Unraveling Clues", 2, "The clues start coming together, leading Cal closer to the truth.", 1),
       (3, "Chapter 1: Adele's Encounter", 1, "Adele witnesses a murder but is unaware of its personal significance.", 2),
       (4, "Chapter 2: Delving Deeper", 2, "Adele begins to uncover the shocking truth behind the murder.", 2),
       (5, "Chapter 1: Alisons Decision", 1, "Alison decides to go undercover on the reality show to find her sister.", 3),
       (6, "Chapter 2: Reality Unmasked", 2, "Alison discovers the darker side of reality TV as she investigates.", 3),
       (7, "Chapter 1: Dormitory Dilemma", 1, "The campus thriller unfolds with suspense and mystery.", 4),
       (8, "Chapter 2: The Roommate Riddle", 2, "The handsome roommate becomes a key suspect in the campus mystery.", 4);

INSERT INTO Bookmark (LibraryID, UserID, StoryID, DateAdded)
VALUES (1, 1, 1, '2022-01-03 09:30:00'),
       (2, 2, 2, '2022-01-07 11:45:00'),
       (3, 3, 3, '2022-01-10 15:20:00'),
       (4, 4, 4, '2022-01-12 08:45:00');

INSERT INTO Comments (CommentID, Content, CommentDate, UserID, StoryID)
VALUES (1, "Exciting start! Can't wait for more twists.", "2022-01-04 14:00:00", 1, 1),
       (2, "This mystery keeps getting better with each chapter.", "2022-01-08 10:30:00", 2, 2),
       (3, "Psychological thriller at its best! Gripping storyline.", "2022-01-11 17:45:00", 3, 3),
       (4, "The campus setting adds a unique twist to the crime story.", "2022-01-13 09:15:00", 4, 4);
      
INSERT INTO Comments (CommentID, Content, CommentDate, UserID, StoryID)
VALUES 
(5, "The suspense in Chapter 4 is killing me! Can't wait for the revelations.", "2022-01-15 14:30:00", 3, 2),
(6, "The character development in this story is phenomenal. Kudos to the author!", "2022-01-20 09:45:00", 4, 2);

select * from Comments;

INSERT INTO Users (UserID, Username, Email, Password, RegistrationDate, LastLoginDate)
VALUES 
(5, 'newuser1', 'newuser1@gmail.com', 'newpass1', '2022-04-15 09:00:00', '2022-04-20 12:00:00'),
(6, 'newuser2', 'newuser2@gmail.com', 'newpass2', '2022-04-20 10:30:00', '2022-04-25 15:45:00'),
(7, 'newuser3', 'newuser3@gmail.com', 'newpass3', '2022-04-25 08:30:00', '2022-04-30 11:00:00');

       
-- Query 1: Register a new user
INSERT INTO Users (UserID, Username, Email, Password, RegistrationDate, LastLoginDate)
VALUES (5, 'user1', 'user1@example.com', 'passuser1', '2024-03-26 12:00:00', NULL);
INSERT INTO Users (UserID, Username, Email, Password, RegistrationDate, LastLoginDate)
VALUES (7, 'user2', 'user2@example.com', 'passuser2', '2024-03-29 12:00:00', NULL);
select * from Users;

-- Query 2: Retrieve all stories written by a specific author
SELECT * FROM Stories WHERE AuthorID = 1;

-- Query 3: Add a new story
INSERT INTO Stories (StoryID, Title, Description, CoverImage, Numberofchps, AuthorID, Genre)
VALUES (5, 'Eridanus Flooding', 'FBI agent Jack Rhodes and Doctor V.C. Coldwater team up to solve a murder involving treason, secret government research, and the Uzbekistani black market.', 'eridanus_flooding.jpg', 82, 3, 'Thriller');
select * from Stories;

-- Query 4: Retrieve stories with more than 55 chapters
SELECT * FROM Stories WHERE Numberofchps > 55;

-- Query 5: Retrieve users who have not logged in recently
SELECT * FROM Users WHERE LastLoginDate < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 YEAR);

-- Query 6: Calculate the average number of chapters per story
SELECT AVG(Numberofchps) AS AvgChapters FROM Stories;

-- Query 7: Retrieve the total number of chapters for each story
SELECT s.Title AS Story_Title, SUM(c.ChapterNo) AS Total_Chapters
FROM Stories s INNER JOIN Chapters c ON s.StoryID = c.StoryID
GROUP BY s.Title;

-- Query 8: Retrieve all bookmarks along with user and story details
SELECT B.LibraryID, U.Username AS User, S.Title AS Story FROM Bookmark B JOIN Users U ON 
B.UserID = U.UserID JOIN Stories S ON B.StoryID = S.StoryID;

-- Query 9: Retrieve all users who have commented on a specific story
SELECT DISTINCT U.Username AS Commenting_User FROM Users U INNER JOIN Comments C ON U.UserID = C.UserID WHERE C.StoryID = 1;

-- Query 10: Delete a bookmark for a specific user and story
DELETE FROM Bookmark WHERE UserID = 3 AND StoryID = 3;
SELECT * FROM Bookmark;

-- Query 11: Retrieve the top 5 most popular genres based on the number of stories
SELECT Genre, COUNT(StoryID) AS Number_of_Stories FROM Stories GROUP BY Genre
ORDER BY Number_of_Stories DESC LIMIT 5;

-- Query 12: Retrieve the total number of comments for each story
SELECT S.Title AS Story_Title, COUNT(C.CommentID) AS Total_Comments FROM Stories S 
LEFT OUTER JOIN Comments C ON S.StoryID = C.StoryID GROUP BY S.Title;

-- Query 13: Retrieve stories along with the count of comments and bookmarks for each
SELECT S.Title AS Story_Title, 
       COUNT(DISTINCT C.CommentID) AS Number_of_Comments,
       COUNT(DISTINCT B.LibraryID) AS Number_of_Bookmarks
FROM Stories S LEFT JOIN Comments C ON S.StoryID = C.StoryID
LEFT JOIN Bookmark B ON S.StoryID = B.StoryID GROUP BY S.Title;

-- Query 14: Retrieve stories and their genres, ordered by genre in descending order
SELECT Title AS Story_Title, Genre
FROM Stories
ORDER BY Genre DESC;

-- Query 15: Retrieve stories with more than 50 chapters and their authors' usernames
SELECT s.Title AS Story_Title, s.Numberofchps AS Chapters_Count, a.Username AS Author_Username
FROM Stories s
INNER JOIN Authors a ON s.AuthorID = a.AuthorID
WHERE s.Numberofchps > 50;




