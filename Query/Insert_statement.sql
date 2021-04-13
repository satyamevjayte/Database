/**Address**/
INSERT INTO`dbsatyamevjayate`.`addresses`(`AddressLine1`,`AddressLine2`,`ZipCode`,`City`,`State`,`Country`)
VALUES('6/102-1,moti sheri','Manchharpura',395003,'Surat','Gujarat','India'),
('6/645 adarsh Soc,','Athawa',395006,'Surat','Gujarat','India');
/**Person**/
INSERT INTO `dbsatyamevjayate`.`person` (`FirstName`, `LastName`, `DateOfBirth`, `Gender`) VALUES ('Shayam', 'Patel', '1973-02-02', 'Male');
INSERT INTO `dbsatyamevjayate`.`person` (`FirstName`, `LastName`, `DateOfBirth`, `Gender`) VALUES ('Mira', 'Rajput', '1970-02-01', 'Female');
INSERT INTO `dbsatyamevjayate`.`person` (`FirstName`, `LastName`, `DateOfBirth`, `Gender`) VALUES ('Ram', 'Gawasker', '1980-02-01', 'Male');
/**Document**
INSERT INTO `dbsatyamevjayate`.`document` (`DocumentType`, `Description`, `UploadDateTime`) VALUES ('AdharCard', 'Unique Identification Card in India', '2020-01-01 10:10:10');
INSERT INTO `dbsatyamevjayate`.`document` (`DocumentType`, `Description`, `UploadDateTime`) VALUES ('PanCard', 'PanCard ', '2021-01-11 12:10:10');
*/
/**Contact**/
INSERT INTO `dbsatyamevjayate`.`contact` (`ContactNumber`, `ContactEmail`) VALUES ('02612564962', 'Mahidharpura@gmail.com');
INSERT INTO `dbsatyamevjayate`.`contact` (`ContactNumber`, `ContactEmail`) VALUES ('02612260035', 'SalabatPura@gmail.com');
INSERT INTO `dbsatyamevjayate`.`contact` (`ContactNumber`, `ContactEmail`) VALUES ('9925236456', 'shyam@gmail.com');
INSERT INTO `dbsatyamevjayate`.`contact` (`ContactNumber`, `ContactEmail`) VALUES ('7585964532', 'ram_gawasker@gmail.com');

/**PoliceStation**/
INSERT INTO `dbsatyamevjayate`.`policestation` (`StationName`, `AddressID`, `ContactID`) VALUES ('Mahidharpura', '2', '2');
INSERT INTO `dbsatyamevjayate`.`policestation` (`StationName`, `AddressID`, `ContactID`) VALUES ('SalabatPura', '3', '3');
INSERT INTO `dbsatyamevjayate`.`policestation` (`StationName`, `AddressID`, `ContactID`) VALUES ('Laldarwaja', '1', '1');

/**PoliceRole**/
INSERT INTO `dbsatyamevjayate`.`policerole` (`RoleName`) VALUES ('SP');
INSERT INTO `dbsatyamevjayate`.`policerole` (`RoleName`) VALUES ('DGP');
INSERT INTO `dbsatyamevjayate`.`policerole` (`RoleName`) VALUES ('Inspectore');

/**Police**/
INSERT INTO `dbsatyamevjayate`.`police` (`PoliceStationID`, `RoleID`, `PersonID`, `ContactID`,  `AddressID`, `Pwd`) VALUES ('4', '1', '1', '1', '1', 'pwd101');
INSERT INTO `dbsatyamevjayate`.`police` (`PoliceStationID`, `RoleID`, `PersonID`, `ContactID`,  `AddressID`, `Pwd`) VALUES ('4', '1', '2', '2',  '2', 'pwd102');
INSERT INTO `dbsatyamevjayate`.`police` (`PoliceStationID`, `RoleID`, `PersonID`, `ContactID`,  `AddressID`, `Pwd`) VALUES ('2', '2', '3', '3',  '3', 'pwd110');

/**LawAct**/
INSERT INTO `dbsatyamevjayate`.`lawact` (`LawName`, `Description`, `Punishment`) VALUES ('Attemp-murder', 'Try to murder someone', '14 years inprisonment');
INSERT INTO `dbsatyamevjayate`.`lawact` (`LawName`, `Description`, `Punishment`) VALUES ('Kindnapping', 'molest someone', '10 years inprisonment');

/**worker**/
INSERT INTO `dbsatyamevjayate`.`worker` (`DateOfJoining`, `DateOfResign`, `AddressID`, `PersonID`, `ContactID`) VALUES ('2021-02-21', '2022-02-02',  1, 2, 2);

