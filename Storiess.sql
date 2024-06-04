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
