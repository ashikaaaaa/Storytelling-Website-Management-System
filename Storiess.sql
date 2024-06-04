CREATE DATABASE StoryDB;
USE StoryDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    LastRead VARCHAR(100),
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
    CoverImage blob,
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

INSERT INTO Users (UserID, Username, Email, Password, LastRead, LastLoginDate) VALUES
(1, 'alice', 'alice@example.com', 'password123', 'Story One - Chapter 3', '2010-05-02 10:00:00'),
(2, 'eve', 'bob@example.com', 'password456', 'Story Two - Chapter 5', '2003-03-01 11:30:00'),
(3, 'diana', 'charlie@example.com', 'password789', 'Story Three - Chapter 2', '2008-05-03 14:45:00'),
(4, 'charlie', 'diana@example.com', 'password101', 'Story Four - Chapter 4', '2004-05-31 16:00:00'),
(5, 'bobo', 'eve@example.com', 'password202', 'Story Five - Chapter 1', '2016-10-24 18:15:00');

INSERT INTO Authors (AuthorID, UserID, Username) VALUES
(1, 1, 'jane'),
(2, 2, 'diana'),
(3, 3, 'mike'),
(4, 4, 'sara'),
(5, 5, 'lily');

INSERT INTO Stories (StoryID, Title, Description, CoverImage, Genre, Numberofchps, AuthorID) VALUES
(1, 'Dead Shot', 'Working as a journalist at a small weekly paper in rural Idaho, 
Cal Murphy begins losing his big city dreams of writing for a metro paper before his passion is reignited after 
three high school star athletes are found dead in a 24-hour period.', 'dead_shot.jpg', 'Thriller', 68, 1),
(2, 'The Whole Truth', "Adele knows she witnessed a murder - what she doesn't know is just how personal it is.", 
'the_whole_truth.jpg', 'Murder Mystery', 51, 2),
(3, 'Paradise Thriller', "Alison's sister disappeared filming a reality show, so she goes undercover as a 
contestant, discovering that in some cases reality tv is all too real.", 'paradise_thriller.jpg', 
'Psychological', 54, 3),
(4, 'Dead If You Do', "A campus thriller: suspense, murder & one handsome roommate.", 'dead_if_you_do.jpg', 
'Crime', 52, 4),
(5, 'The Lost Kingdom', 'An epic journey to reclaim a lost kingdom from the shadows.', 'lost_kingdom.jpg', 
'Fantasy', 45, 5);

INSERT INTO Chapters (ChapterID, Title, ChapterNo, Content, StoryID) VALUES
(1, 'Chapter 1: Into the Rabbit Hole', 1, 'Alice falls into a rabbit hole and discovers a magical world.', 1),
(2, 'Chapter 2: The Cheshire Cat', 2, 'Alice meets the mischievous Cheshire Cat.', 1),
(3, 'Chapter 1: The Strange Letter', 1, 'Detective Smith receives a strange letter.', 2),
(4, 'Chapter 2: The Missing Jewel', 2, 'The mystery deepens as Detective Smith investigates a missing jewel.', 2),
(5, 'Chapter 1: The Disappearance', 1, 'Alison discovers her sister is missing.', 3),
(6, 'Chapter 2: Undercover', 2, 'Alison goes undercover on the reality show.', 3),
(7, 'Chapter 1: Campus Life', 1, 'The story begins on a lively college campus.', 4),
(8, 'Chapter 2: The Murder', 2, 'A shocking murder occurs on campus.', 4),
(9, 'Chapter 1: The Kingdom Falls', 1, 'The kingdom is taken over by dark forces.', 5),
(10, 'Chapter 2: The Journey Begins', 2, 'The protagonists begin their quest to reclaim the kingdom.', 5);

INSERT INTO Bookmark (LibraryID, UserID, StoryID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO Comments (CommentID, Content, CommentDate, UserID, StoryID) VALUES
(1, 'Great story!', '2024-05-01 10:30:00', 1, 1),
(2, 'Loved it!', '2024-05-02 12:00:00', 2, 2),
(3, 'Amazing chapters!', '2024-05-03 15:00:00', 3, 3),
(4, 'Very intriguing!', '2024-05-04 17:00:00', 4, 4),
(5, 'Can\'t wait for the next chapter!', '2024-05-05 19:00:00', 5, 5);

-- QUERIES

-- Query 1: Register a new user
INSERT INTO Users (UserID, Username, Email, Password, RegistrationDate, LastLoginDate)
VALUES (6, 'beomie', 'beomie@mail.com', 'passbeomie', '2001-03-13 12:00:00', NULL);
SELECT * FROM Users;

-- Query 2: Retrieve all stories written by a specific author
SELECT * FROM Stories WHERE AuthorID = 1;

-- Query 3: Add a new story
INSERT INTO Stories (StoryID, Title, Description, CoverImage, Numberofchps, AuthorID, Genre)
VALUES (6, 'Eridanus Flooding', 'FBI agent Jack Rhodes and Doctor V.C. Coldwater 
team up to solve a murder involving treason, secret government research, and the Uzbekistani black 
market.', 'eridanus_flooding.jpg', 82, 3, 'Thriller');
SELECT * FROM Stories;

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
SELECT Title AS Story_Title, Genre FROM Stories ORDER BY Genre DESC;

-- Query 15: Retrieve stories with more than 50 chapters and their authors' usernames
SELECT s.Title AS Story_Title, s.Numberofchps AS Chapters_Count, a.Username AS Author_Username
FROM Stories s INNER JOIN Authors a ON s.AuthorID = a.AuthorID WHERE s.Numberofchps > 50;

-- Query 16: Create a view for Active Users:
CREATE VIEW ActiveUser AS
SELECT * FROM Users
WHERE LastLoginDate >= DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 2 YEAR);

-- Query 17: Create a View for Popular Genres
CREATE VIEW PopularGenres AS
SELECT Genre, COUNT(StoryID) AS Number_of_Stories
FROM Stories GROUP BY Genre ORDER BY Number_of_Stories DESC LIMIT 3;

-- Query 18: Create a View for Bookmarked Stories
CREATE VIEW BookmarkedStories AS
SELECT S.Title AS Story_Title, COUNT(B.LibraryID) AS Total_Bookmarks
FROM Stories S
LEFT OUTER JOIN Bookmark B ON S.StoryID = B.StoryID
GROUP BY S.Title;

-- Query 19: Retrieve the total number of comments for each story, sorted in descending order of total comments
SELECT S.Title AS Story_Title, COUNT(C.CommentID) AS Total_Comments 
FROM Stories S LEFT OUTER JOIN Comments C ON S.StoryID = C.StoryID GROUP BY S.Title ORDER BY Total_Comments DESC;

-- Query 20: Retrieve the average number of comments per story
SELECT AVG(CommentsPerStory) AS AvgCommentsPerStory FROM (SELECT COUNT(*) AS CommentsPerStory FROM Comments GROUP BY StoryID) AS CommentCounts;

