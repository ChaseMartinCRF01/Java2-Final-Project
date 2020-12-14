DROP DATABASE IF EXISTS animal_database;
CREATE DATABASE animal_database;
USE animal_database;
 
/* *****************************************************************************
	Create statement for table Animal
***************************************************************************** */
DROP TABLE IF EXISTS Animal;
CREATE TABLE Animal(
    Animal_ID VARCHAR(25) NOT NULL,
    Animal_Name VARCHAR(100) NOT NULL,
    Animal_Species VARCHAR(100) NOT NULL,
    Animal_Gender VARCHAR(6) NOT NULL,
	Animal_Age INT NOT NULL,
	Animal_Fixed BOOLEAN NOT NULL,
	Animal_Legs INT NOT NULL,
	Animal_Weight DECIMAL NOT NULL,
	Animal_Date_Added DATE NOT NULL,
	Animal_Last_Fed DATE NOT NULL,
	PRIMARY KEY(Animal_ID))
	;
	
/* *****************************************************************************
	Build Stored Procedure sp_add_animal_record
***************************************************************************** */
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_add_animal_record$$
CREATE PROCEDURE sp_add_animal_record(
    IN P_Animal_ID VARCHAR(25),
    IN p_Animal_Species VARCHAR(100),
    IN p_Animal_Name VARCHAR(100),
    IN p_Animal_Gender VARCHAR(6),
	IN p_Animal_Age INT,
	IN p_Animal_Fixed BOOLEAN,
	IN p_Animal_Legs INT,
	IN p_Animal_Weight DECIMAL,
	IN p_Animal_Date_Added DATE,
	IN p_Animal_Last_Fed DATE
)
BEGIN
    INSERT INTO Animal(
    Animal_ID,
    Animal_Name,
    Animal_Species,
    Animal_Gender,
	Animal_Age,
	Animal_Fixed,
	Animal_Legs,
	Animal_Weight,
	Animal_Date_Added,
	Animal_Last_Fed
    )
    VALUES (
    p_Animal_ID,
    p_Animal_Name,
    p_Animal_Species,
    p_Animal_Gender,
	p_Animal_Age,
	p_Animal_Fixed,
	p_Animal_Legs,
	p_Animal_Weight,
	p_Animal_Date_Added,
	p_Animal_Last_Fed
    );
END$$
DELIMITER ;
 
 
/* *****************************************************************************
	Build Stored Procedure sp_get_an_animal
***************************************************************************** */
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_get_an_animal$$
CREATE PROCEDURE sp_get_an_animal( 
	IN p_original_Animal_ID VARCHAR(25)
) 
BEGIN
	SELECT
    Animal_ID,
    Animal_Name,
    Animal_Species,
    Animal_Gender,
	Animal_Age,
	Animal_Fixed,
	Animal_Legs,
	Animal_Weight,
	Animal_Date_Added,
	Animal_Last_Fed
	FROM Animal
    WHERE Animal_ID = p_original_Animal_ID;
END$$
DELIMITER ;
 

 
/* *****************************************************************************
	Add Animals
***************************************************************************** */
CALL sp_add_animal_record('1001','Sparky','Lizard','Male',2,true,4,5,2020-11-08,2020-11-04);
CALL sp_add_animal_record('1002','Sophie','Dog','Female',5,false,4,45,2020-10-09,2020-11-04);
CALL sp_add_animal_record('1003','Noelle','Cat','Male',7,true,4,20,2019-10-08,2020-11-04);
 
/* *****************************************************************************
                               END OF SCRIPT	
***************************************************************************** */

   

