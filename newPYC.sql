DROP SCHEMA
IF EXISTS PYC;
	CREATE SCHEMA PYC COLLATE = utf8_general_ci;

USE PYC;
/* Details of REgistered User*/
CREATE TABLE regUser (
	reg_id INT (11) ,
	name VARCHAR(20),
	email VARCHAR(20) unique NOT NULL,
	street_add VARCHAR(25),
	postal_code VARCHAR(20),
	city VARCHAR(30) NOT NULL,
	state VARCHAR(25) NOT NULL,
	phone INT(11) NOT NULL,
	alt_phone INT(11),
	PRIMARY KEY (reg_id)
	);
/*Details of Location */
CREATE TABLE Locations(
		location_id INT(11) ,
		location_name VARCHAR(20) NOT NULL,
		location_desc VARCHAR(200),
		state VARCHAR(25) NOT NULL,
		PRIMARY KEY(location_id)
		);

CREATE TABLE Activities(
		activity_id INT(11) ,
		activity_name VARCHAR(50) NOT NULL,
		activity_cost DECIMAL(10,2) NOT NULL,
		location_id INT(11) ,
		PRIMARY KEY(activity_id),
		CONSTRAINT Activities_Location_location_id FOREIGN KEY (location_id) REFERENCES Locations(location_id)
		);
		
CREATE TABLE Inviter(
		invite_code INT(11) ,
		reg_id INT(11),
		invite_email VARCHAR(20),
		status VARCHAR(30),
		PRIMARY KEY(invite_code),
		CONSTRAINT Invites_regUser_reg_id FOREIGN KEY (reg_id) REFERENCES regUser(reg_id)
		);
CREATE TABLE feedback(
		feedback_id INT(11),
		food VARCHAR(20),
		accomodation VARCHAR(20),
		service_support VARCHAR(20),
		activities VARCHAR(30),
		others VARCHAR(50),
		location_id INT(11) ,
		reg_id INT (11) ,
		PRIMARY KEY(feedback_id),
		CONSTRAINT feedback_regUser_reg_id FOREIGN KEY (reg_id) REFERENCES regUser(reg_id),
		CONSTRAINT feedback_locations_reg_id FOREIGN KEY (location_id) REFERENCES Locations(location_id)
	
		);
/* for each location<<-1--<>--1->>campPlanner*/		
CREATE TABLE campPlanner(
		campplanner_id INT(11),
		location_id INT(11),
		email VARCHAR(20) unique NOT NULL,
		phone INT(11) NOT NULL,
		alt_phone INT(11),
		PRIMARY KEY(campplanner_id),
		CONSTRAINT campPlanner_locations_reg_id FOREIGN KEY (location_id) REFERENCES Locations(location_id)
	);
		

		
CREATE TABLE locActivity(
		LocActivity_id INT(11),
		campplan_id INT(11),
		activity1 VARCHAR(20),
		activity2 VARCHAR(20),
		activity3 VARCHAR(20),
		PRIMARY KEY(LocActivity_id)
		
		);
		
		

		
		