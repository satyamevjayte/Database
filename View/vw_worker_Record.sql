CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_worker_record` AS
    SELECT 
        CONCAT(`p`.`FirstName`, ' ', `p`.`LastName`) AS `Owner Name`,
        CONCAT(`pw`.`FirstName`, ' ', `pw`.`LastName`) AS `Worker Name`,
        `w`.`DateOfJoining` AS `DateOfJoining`,
        `w`.`DateOfResign` AS `Approx Date of Leaving`,
        `c1`.`ContactNumber` AS `ContactNumber`,
        `c1`.`ContactEmail` AS `ContactEmail`,
        `a`.`AddressLine1` AS `AddressLine1`,
        `a`.`AddressLine2` AS `AddressLine2`,
        `a`.`ZipCode` AS `ZipCode`,
        `a`.`City` AS `City`,
        `a`.`State` AS `State`,
        `a`.`Country` AS `Country`
    FROM
        ((((((`worker` `w`
        JOIN `formverification` `f`)
        JOIN `complainer` `c`)
        JOIN `person` `p`)
        JOIN `person` `pw`)
        JOIN `addresses` `a`)
        JOIN `contact` `c1`)
    WHERE
        ((`f`.`WorkerID` = `w`.`WorkerID`)
            AND (`c`.`ComplainerID` = `f`.`ComplainerID`)
            AND (`p`.`PersonID` = `c`.`PersonID`)
            AND (`pw`.`PersonID` = `w`.`PersonID`)
            AND (`a`.`AddressID` = `w`.`AddressID`)
            AND (`c1`.`ContactID` = `w`.`ContactID`))