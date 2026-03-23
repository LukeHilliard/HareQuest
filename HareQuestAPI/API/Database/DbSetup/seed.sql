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



INSERT INTO Users (Id, Name, Email, Password, Salt, Role)
VALUES (UUID(), 'Stuart Little', 'slittle@gmail.com', 'Test1234567!', 'test', 'student'),
       (UUID(), 'Matilda Wormwood', 'mwormwood@gmail.com', 'Test1234567!', 'test', 'student'),
       (UUID(), 'Mary Poppins', 'mpoppins@gmail.com', 'Test1234567!', 'test', 'parent'),
       (UUID(), 'Jennifer Honey', 'jhoney@gmail.com', 'Test1234567!', 'test', 'teacher'),
       (UUID(), 'Euphegenia Doubtfire', 'edoubtfire@gmail.com', 'Test1234567!', 'test', 'teacher');