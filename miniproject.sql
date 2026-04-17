CREATE DATABASE Online_Learning_System;
USE Online_Learning_System;

CREATE TABLE Instructor (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);


CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Course (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(200) NOT NULL,
    Description TEXT,
    Sessions INT,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);


CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    EnrollDate DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


CREATE TABLE Result (
    StudentID INT,
    CourseID INT,
    MidtermScore DECIMAL(4,2) CHECK (MidtermScore BETWEEN 0 AND 10),
    FinalScore DECIMAL(4,2) CHECK (FinalScore BETWEEN 0 AND 10),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Instructor (InstructorID, FullName, Email) VALUES 
(1, 'Nguyễn Văn A', 'anv@uni.edu.vn'),
(2, 'Trần Thị B', 'btt@uni.edu.vn'),
(3, 'Lê Quang C', 'clq@uni.edu.vn'),
(4, 'Phạm Minh D', 'dpm@uni.edu.vn'),
(5, 'Hoàng Anh E', 'eha@uni.edu.vn');

INSERT INTO Student (StudentID, FullName, DateOfBirth, Email) VALUES 
(101, 'Nguyễn Sinh Viên 1', '2003-01-10', 'sv1@gmail.com'),
(102, 'Trần Sinh Viên 2', '2003-05-15', 'sv2@gmail.com'),
(103, 'Lê Sinh Viên 3', '2004-11-20', 'sv3@gmail.com'),
(104, 'Phạm Sinh Viên 4', '2003-09-05', 'sv4@gmail.com'),
(105, 'Võ Sinh Viên 5', '2004-02-28', 'sv5@gmail.com');

INSERT INTO Course (CourseID, CourseName, Description, Sessions, InstructorID) VALUES 
(10, 'SQL Cơ Bản', 'Học về thiết kế CSDL', 12, 1),
(11, 'Lập trình Java', 'Cấu trúc dữ liệu Java', 20, 2),
(12, 'Web Frontend', 'HTML, CSS và JS', 15, 3),
(13, 'Python cho Data', 'Phân tích dữ liệu', 18, 1),
(14, 'Học máy cơ bản', 'Nhập môn AI', 24, 5);

INSERT INTO Enrollment (StudentID, CourseID, EnrollDate) VALUES 
(101, 10, '2024-01-01'),
(101, 11, '2024-01-02'),
(102, 10, '2024-01-01'),
(103, 12, '2024-01-05'),
(104, 13, '2024-01-10');

INSERT INTO Result (StudentID, CourseID, MidtermScore, FinalScore) VALUES 
(101, 10, 8.5, 9.0),
(101, 11, 7.0, 8.0),
(102, 10, 6.0, 7.5),
(103, 12, 9.0, 9.5),
(104, 13, 5.5, 6.0);

UPDATE Student SET Email = 'new_sv1@gmail.com' WHERE StudentID = 101;
UPDATE Course SET Description = 'Học về DDL và DML nâng cao' WHERE CourseID = 10;
UPDATE Result SET FinalScore = 10.0 WHERE StudentID = 103 AND CourseID = 12;

DELETE FROM Result WHERE StudentID = 104 AND CourseID = 13;
DELETE FROM Enrollment WHERE StudentID = 104 AND CourseID = 13;

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;