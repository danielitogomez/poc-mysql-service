SET FOREIGN_KEY_CHECKS=0; -- Desactivating foreign key while creating model.

DROP DATABASE IF EXISTS it_db;

CREATE DATABASE IF NOT EXISTS it_db;

USE it_db;

CREATE TABLE IF NOT EXISTS `it_workstation` (
    id INT(10) NOT NULL AUTO_INCREMENT,
    device_type VARCHAR(30),
    device_cost INT(10),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `it_logs` (
    id_logs INT(10) NOT NULL AUTO_INCREMENT,
    id_it_workstation_fk INT(10),
    description_it TEXT NOT NULL,
    created DATETIME NOT NULL,
    PRIMARY KEY (id_logs),
    FOREIGN KEY (id_it_workstation_fk)
        REFERENCES it_workstation (id)
);

CREATE TABLE IF NOT EXISTS `employees` (
    id_employees INT(10) NOT NULL AUTO_INCREMENT,
	id_employee_workstation_fk INT(10),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(250),
    location VARCHAR(100),
    PRIMARY KEY (id_employees),
	FOREIGN KEY (id_employee_workstation_fk)
        REFERENCES it_workstation (id),
	UNIQUE (id_employee_workstation_fk) -- saying that this FK is UNIQUE 1:1 relation
/* Another way to do it shoud be
	Use the same PK as FK too because the PK is UNIQUE as default
    id_employees INT(10) NOT NULL AUTO_INCREMENT,
        PRIMARY KEY (id_employees),
	FOREIGN KEY (id_employees)
        REFERENCES it_workstation (id),
	UNIQUE (id_employees)
    But is a good idea set diferent keys in a short model dont' care but in big ones
    it's going to be an important detail
*/
);

CREATE TABLE IF NOT EXISTS `tickets` (
    id_tickets INT(10) UNIQUE KEY NOT NULL AUTO_INCREMENT,
    ticket_number INT(10) UNIQUE KEY,
    created DATETIME NOT NULL,
    id_employee_assign_fk INT(10),
    id_workstation_fk INT(10),
    ticket_description TEXT NOT NULL,
    PRIMARY KEY (id_tickets),
    FOREIGN KEY (id_employee_assign_fk)
        REFERENCES employees (id_employees),
    FOREIGN KEY (id_workstation_fk)
        REFERENCES it_workstation (id)
);

SET FOREIGN_KEY_CHECKS=1 -- Activating foreign key after model created.
