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

CREATE TABLE ShopItem
(
  Id INT NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Cost INT NOT NULL,  
); 
    
    
INSERT INTO Users (Id, Name, Email, Password, Salt, Role)
VALUES (UUID(), 'Stuart Little', 'slittle@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'student'),
       (UUID(), 'Matilda Wormwood', 'mwormwood@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'student'),
       (UUID(), 'Mary Poppins', 'mpoppins@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'parent'),
       (UUID(), 'Jennifer Honey', 'jhoney@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'teacher'),
       (UUID(), 'Euphegenia Doubtfire', 'edoubtfire@gmail.com', 'OFHrBJexEcjWIlslrHJ2cCtaDHWbeTyUPOcaUKfRN44=', 'gt5YkohtwmD62TuRkohA2Q==', 'teacher');
