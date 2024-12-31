DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `transaction1`()
BEGIN
START TRANSACTION;
UPDATE billing SET status="paid" WHERE billID=115;
COMMIT;
END//
CALL transaction1();
DELIMITER ;