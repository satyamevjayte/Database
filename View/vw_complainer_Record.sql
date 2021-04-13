CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vw_complainer` AS
    SELECT 
        CONCAT(`p`.`FirstName`, ' ', `p`.`LastName`) AS `Name`,
        `c1`.`ContactNumber` AS `ContactNumber`,
        `c1`.`ContactEmail` AS `ContactEmail`,
        `a`.`AddressLine1` AS `AddressLine1`,
        `a`.`AddressLine2` AS `AddressLine2`,
        `a`.`ZipCode` AS `ZipCode`,
        `a`.`City` AS `City`,
        `a`.`State` AS `State`,
        `a`.`Country` AS `Country`
    FROM
        (((`complainer` `c`
        JOIN `person` `p`)
        JOIN `addresses` `a`)
        JOIN `contact` `c1`)
    WHERE
        ((`p`.`PersonID` = `c`.`PersonID`)
            AND (`a`.`AddressID` = `c`.`AddressID`)
            AND (`c1`.`ContactID` = `c`.`ContactID`))