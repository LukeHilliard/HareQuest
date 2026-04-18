DROP TABLE IF EXISTS ClassStudents;
DROP TABLE IF EXISTS ClassGroups;
DROP TABLE IF EXISTS ShopItem;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users
(
    Id       CHAR(36)     NOT NULL,
    Name     VARCHAR(200) NOT NULL,
    Email    VARCHAR(200) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Salt     VARCHAR(255) NOT NULL,
    Role     VARCHAR(8)   NOT NULL,

    PRIMARY KEY (Id)
);

CREATE TABLE ClassGroups
(
    Id          CHAR(36)     NOT NULL,
    TeacherId   CHAR(36)     NOT NULL,
    Name   VARCHAR(100) NOT NULL,
    ClassLevel  VARCHAR(4)   NOT NULL,
    ClassCode   VARCHAR(6)   NOT NULL,
    
    PRIMARY KEY (Id),
    FOREIGN KEY (TeacherId) REFERENCES Users(Id)
    
);

CREATE TABLE ClassStudents
(
    Id          CHAR(36)     NOT NULL,
    ParentId    CHAR(36)     NOT NULL,
    ClassId     CHAR(36)     NOT NULL,
    StudentName VARCHAR(100) NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (ParentId) REFERENCES Users(Id),
    FOREIGN KEY (ClassId) REFERENCES ClassGroups(Id)
    
);

CREATE TABLE ShopItem
(
    Id   INT          NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Cost INT          NOT NULL,
);

    
INSERT INTO Users (Id, Name, Email, Password, Salt, Role)
VALUES ('11111111-1111-1111-1111-111111111111', 'Stuart Little', 'slittle@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'student'),
       ('11111111-1111-1111-1111-111111111112', 'Matilda Wormwood', 'mwormwood@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'student'),
       ('11111111-1111-1111-1111-111111111113', 'Mary Poppins', 'mpoppins@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'parent'),
       ('11111111-1111-1111-1111-111111111114', 'Jennifer Honey', 'jhoney@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'teacher'),
       ('11111111-1111-1111-1111-111111111115', 'Euphegenia Doubtfire', 'edoubtfire@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'teacher');
