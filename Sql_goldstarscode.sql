/* --------------------- 
SQL CODE, this is a schemas for company 
database you have absolute right to copy 
this code and modify as yours
  --------------------------- */
		/*location table*/
CREATE TABLE IF NOT EXISTS location (
    location_id INT NOT NULL AUTO_INCREMENT,
    country VARCHAR(100) NULL,
    city_state_province VARCHAR(100) NULL,
    address VARCHAR(100) NULL,
    zipCode VARCHAR(10) NULL,
    PRIMARY KEY (location_id)
);
	/*position table*/
CREATE TABLE IF NOT EXISTS position (
    position_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NULL,
    education VARCHAR(100) NULL,
    min_salary DECIMAL(7 , 2 ) NULL,
    max_salary DECIMAL(7 , 2 ) NULL,
    PRIMARY KEY (position_id)
);
	/*company table*/
 CREATE TABLE IF NOT EXISTS company(
  company_id INT NOT NULL AUTO_INCREMENT,
  company_name VARCHAR(100) NULL,
  phone INT NULL,
  email VARCHAR(100) NULL,
  location_id INT NULL,
  PRIMARY KEY (company_id),
  UNIQUE INDEX phone_UNIQUE (phone ASC) VISIBLE,
  INDEX location_id_idx (location_id ASC) VISIBLE,
  CONSTRAINT location_id
    FOREIGN KEY (location_id)
    REFERENCES location (location_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
 
	/*company table*/
 CREATE TABLE IF NOT EXISTS department(
  dep_id INT NOT NULL AUTO_INCREMENT,
  departmentName VARCHAR(100) NULL,
  PRIMARY KEY (dep_id));
 
 	/*employee table*/
CREATE TABLE IF NOT EXISTS employee(
  emp_id INT NOT NULL AUTO_INCREMENT,
  lastName VARCHAR(100) NULL,
  firstName VARCHAR(100) NULL,
  dob DATE NULL,
  gender CHAR(1),
 constraint CHK_gender check (gender = "M" or gender ="F"),
  performacce VARCHAR(100) NULL,
  hiredate DATE NULL,
  salary DECIMAL(7,2) NULL,
  location_id INT NULL,
  position_id INT NULL,
  company_id INT NULL,
  dep_id INT NULL,
  PRIMARY KEY (emp_id),
  INDEX dep_id_idx(dep_id ASC) VISIBLE,
  INDEX position_id_idx (position_id ASC) VISIBLE,
  INDEX location_id_idx (location_id ASC) VISIBLE,
  INDEX company_id_idx (company_id ASC) VISIBLE,
  CONSTRAINT dep_id
  FOREIGN KEY (dep_id)
  REFERENCES department (dep_id)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
  CONSTRAINT position_id
    FOREIGN KEY (position_id)
    REFERENCES position (position_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT location_id
    FOREIGN KEY (location_id)
    REFERENCES location(location_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT company_id
    FOREIGN KEY (company_id)
    REFERENCES company (company_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
 
 
 
 
 
  
 