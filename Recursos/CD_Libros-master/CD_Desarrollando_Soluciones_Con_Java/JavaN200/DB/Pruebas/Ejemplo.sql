create table t2(
	s1 int, 
	primary key ( s1 )
) engine=innodb;

DELIMITER $$

DROP PROCEDURE IF EXISTS p24$$

CREATE PROCEDURE p24 ()
BEGIN
	DECLARE `Constraint Violation` CONDITION FOR SQLSTATE '23000';
	DECLARE EXIT HANDLER FOR `Constraint Violation` ROLLBACK;
	START TRANSACTION;
	INSERT INTO t2 VALUES (1);
	INSERT INTO t2 VALUES (1);
	COMMIT;
END$$ 

DELIMITER ;

CALL p24();