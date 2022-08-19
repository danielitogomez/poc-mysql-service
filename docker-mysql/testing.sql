CREATE DATABASE IF NOT EXISTS testing;

USE testing;

CREATE TABLE IF NOT EXISTS country (
    id INT(10) NOT NULL AUTO_INCREMENT,
    Country VARCHAR(50) NOT NULL,
    Last_Update timestamp NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Language (
    id INT(10) NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Last_Update timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Customer (
    id INT(10) NOT NULL AUTO_INCREMENT,
    AddressID INT(10) NOT NULL,
    AddressColumn INT(10),
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255),
    Email VARCHAR(50) NOT NULL,
    Active char(1),
    Create_Date timestamp,
    Last_Update timestamp,
    PRIMARY KEY (id)
);

INSERT IGNORE INTO Customer (AddressID, First_Name, Email) VALUES ('1', 'lala', 'lala@gmail.com');
ALTER TABLE Customer ADD UNIQUE INDEX(AddressID, First_Name, Email);

INSERT IGNORE INTO Language (Name) VALUES ('Spanish');
ALTER TABLE Language ADD UNIQUE INDEX(Name);
INSERT IGNORE INTO Language (Name) VALUES ('English');
ALTER TABLE Language ADD UNIQUE INDEX(Name);