/*
ABC inc
by lala
Date: today
Topic: Database from IT team bla bla
Code revision 0.0.1
MySQL 8.0
*/

SET FOREIGN_KEY_CHECKS=0; -- here will disabled the checks of foreign keys while mode are creating

DROP DATABASE IF EXISTS abc_company;

CREATE DATABASE IF NOT EXISTS abc_company;

USE abc_company;

CREATE TABLE IF NOT EXISTS `workstation` (
    id INT(10) NOT NULL AUTO_INCREMENT,
    device_type VARCHAR(30) NOT NULL,
    device_cost INT(10) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `logs` (
    id_logs INT(10) NOT NULL AUTO_INCREMENT,
    id_workstation_logs_fk INT(10) NOT NULL,
    description_logs TEXT,
    created DATETIME NOT NULL,
    PRIMARY KEY (id_logs),
        FOREIGN KEY (id_workstation_logs_fk)
        REFERENCES workstation (id)
);

CREATE TABLE IF NOT EXISTS `employee` (
    id_employee INT(10) NOT NULL AUTO_INCREMENT,
    id_workstation_fk INT(10) UNIQUE KEY NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    employee_email VARCHAR(100),
    employee_location VARCHAR(100),
    PRIMARY KEY (id_employee),
        FOREIGN KEY (id_workstation_fk)
        REFERENCES workstation (id)
);

CREATE TABLE IF NOT EXISTS `ticket` (
    id_ticket INT(10) NOT NULL AUTO_INCREMENT,
    id_employee_fk INT(10) NOT NULL,
    number_ticket INT(10) NOT NULL,
    created DATETIME NOT NULL,
    description_tickets TEXT NOT NULL,
    PRIMARY KEY (id_ticket),
        FOREIGN KEY (id_employee_fk)
        REFERENCES employee (id_employee)
);

SET FOREIGN_KEY_CHECKS=1; -- here will enable the checks of foreign keys when the build of schema mode of Database finished.




