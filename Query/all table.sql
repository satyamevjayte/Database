CREATE DATABASE	dbsatyamevjayate;

/*  TABLE FOR POLICEROLE  */
use dbsatyamevjayate;
CREATE TABLE PoliceRole(
RoleID BIGINT AUTO_INCREMENT PRIMARY KEY ,
RoleName VARCHAR(50) NOT NULL
);




/* TABLR FOR ADDRESS */

CREATE TABLE Addresses(
AddressID BIGINT AUTO_INCREMENT PRIMARY KEY,
AddressLine1 VARCHAR(100) NOT NULL,
AddressLine2 VARCHAR(100),
ZipCode int NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(50) NOT NULL,
Country VARCHAR(50) NOT NULL
);



/* TABLE FOR CONTACT*/

CREATE TABLE Contact(
ContactID BIGINT AUTO_INCREMENT PRIMARY KEY,
ContactNumber BIGINT,
ContactEmail VARCHAR(70)
);


/* TABLE FOR PERSON */

CREATE TABLE Person(
PersonID BIGINT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
DateOfBirth DATE NOT NULL,
Gender varchar(20) NOT NULL,
PersonImage  VARBINARY(160) NOT NULL
);




/* TABLE FOR DOCUMENT  */



/* TABLE FOR POLICESTATION */

CREATE TABLE PoliceStation(
PoliceStationID BIGINT AUTO_INCREMENT PRIMARY KEY,
StationName VARCHAR(50) NOT NULL,
AddressID BIGINT,
ContactID BIGINT
);



ALTER TABLE PoliceStation 
ADD CONSTRAINT fkPoliceStationAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

ALTER TABLE PoliceStation 
ADD CONSTRAINT fkPoliceStationContactID FOREIGN KEY(ContactID) REFERENCES Contact(ContactID);
/* TABLE FOR POLICE*/

CREATE TABLE Police(
PoliceID BIGINT AUTO_INCREMENT PRIMARY KEY,
PoliceStationID BIGINT,
RoleID BIGINT,
PersonID BIGINT,
ContactID BIGINT,

AddressID BIGINT,
Pwd VARCHAR(16) NOT NULL,
PoliceCardImage VARBINARY(250) NOT NULL
);



ALTER TABLE Police 
ADD CONSTRAINT fkPoliceStationID FOREIGN KEY(PoliceStationID) REFERENCES PoliceStation(PoliceStationID);

ALTER TABLE Police 
ADD CONSTRAINT fkPoliceRoleID FOREIGN KEY(RoleID) REFERENCES PoliceRole(RoleID);

ALTER TABLE Police 
ADD CONSTRAINT fkPolicePersonID FOREIGN KEY(PersonID) REFERENCES Person(PersonID);

ALTER TABLE Police 
ADD CONSTRAINT fkPoliceAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

ALTER TABLE Police 
ADD CONSTRAINT fkPoliceContactID FOREIGN KEY(ContactID) REFERENCES Contact(ContactID);

CREATE TABLE police_document(
DocumentID BIGINT AUTO_INCREMENT PRIMARY KEY,
PoliceID BIGINT,
DocumentType VARCHAR(70) NOT NULL,
DocumentImage VARBINARY(160) NOT NULL,
Description VARCHAR(100) NULL,
UploadDateTime DATETIME NOT NULL
);
ALTER TABLE police_document 
ADD CONSTRAINT fkPoliceDocumentID FOREIGN KEY(PoliceID) REFERENCES Police(PoliceID);


/* TABLE FOR LAWACT */

CREATE TABLE LawAct(
LawID BIGINT AUTO_INCREMENT PRIMARY KEY,
LawName VARCHAR(50) NOT NULL,
Description VARCHAR(100) NULL,
Punishment VARCHAR(100) NOT NULL
);



/* TABLE FOR CRIMETYPE */

CREATE TABLE CrimeType(
CrimeTypeID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeType VARCHAR(50) NOT NULL 
);


/* TABLE FOR CRIME */

CREATE TABLE Crime(
CrimeID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeTypeID BIGINT,
AddressID BIGINT,
CrimeDate DATE NOT NULL,
CrimeTime DATETIME NOT NULL,
Description VARCHAR(100) NULL
);



ALTER TABLE Crime 
ADD CONSTRAINT fkCrimeTypeID FOREIGN KEY(CrimeTypeID) REFERENCES CrimeType(CrimeTypeID);

ALTER TABLE Crime 
ADD CONSTRAINT fkCrimeAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

/* TABLE FOR CRIME IMAGE */

CREATE TABLE CrimeImage(
CrimeImageID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeID BIGINT,
CrimeImage VARBINARY(250) NOT NULL
);



ALTER TABLE CrimeImage 
ADD CONSTRAINT fkCrimeImageCrimeID FOREIGN KEY(CrimeID) REFERENCES Crime(CrimeID);


/*  TABLE FOR CRIME SUSPECT */

CREATE TABLE CrimeSuspect(
CrimeSuspectID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeID BIGINT,
AddressID BIGINT,
PersonID  BIGINT,

ContactID BIGINT
);



ALTER TABLE CrimeSuspect 
ADD CONSTRAINT fkCrimeSuspectCrimeID FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID);


ALTER TABLE CrimeSuspect 
ADD CONSTRAINT fkCrimeSuspectPersonID FOREIGN KEY (PersonID) REFERENCES Person(PersonID);


ALTER TABLE CrimeSuspect 
ADD CONSTRAINT fkCrimeSuspectAddressID FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID);


ALTER TABLE CrimeSuspect 
ADD CONSTRAINT fkCrimeSuspectContactID FOREIGN KEY (ContactID) REFERENCES Contact(ContactID);

CREATE TABLE CrimeSuspect_document(
DocumentID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeSuspectID BIGINT,
DocumentType VARCHAR(70) NOT NULL,
DocumentImage VARBINARY(160) NOT NULL,
Description VARCHAR(100) NULL,
UploadDateTime DATETIME NOT NULL
);
ALTER TABLE CrimeSuspect_document 
ADD CONSTRAINT fkCrimeSuspectDocumentID FOREIGN KEY(CrimeSuspectID) REFERENCES CrimeSuspect(CrimeSuspectID);


/* TABLE FOR CRIME VICTIM  */

CREATE TABLE CrimeVictim(
CrimeVictimID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeID BIGINT,
PersonID BIGINT,
ContactID BIGINT,
AddressID BIGINT,
Height FLOAT NULL,
Weight FLOAT NULL
);



ALTER TABLE CrimeVictim 
ADD CONSTRAINT fkCrimeVictimCrimeID FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID);


ALTER TABLE CrimeVictim 
ADD CONSTRAINT fkCrimeVictimPersonID FOREIGN KEY (PersonID) REFERENCES Person(PersonID);


ALTER TABLE CrimeVictim 
ADD CONSTRAINT fkCrimeVictimeAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

ALTER TABLE CrimeVictim 
ADD CONSTRAINT fkPersonContactID FOREIGN KEY(ContactID) REFERENCES Contact(ContactID);

CREATE TABLE CrimeVictim_document(
DocumentID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeVictimID BIGINT,
DocumentType VARCHAR(70) NOT NULL,
DocumentImage VARBINARY(160) NOT NULL,
Description VARCHAR(100) NULL,
UploadDateTime DATETIME NOT NULL
);
ALTER TABLE CrimeVictim_document 
ADD CONSTRAINT fkCrimeVictimDocumentID FOREIGN KEY(CrimeVictimID) REFERENCES CrimeVictim(CrimeVictimID);


/* TABLE FOR CRIME EVIDENCE*/

CREATE TABLE CrimeEvidence(
EvidenceID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeID BIGINT,
Name VARCHAR(50) NOT NULL,
Description VARCHAR(100) NULL
);



ALTER TABLE CrimeEvidence 
ADD CONSTRAINT fkCrimeEvidenceCrimeID FOREIGN KEY(CrimeID) REFERENCES Crime(CrimeID);

/* TABLE FOR COMPLAINER */

CREATE TABLE Complainer(
ComplainerID BIGINT AUTO_INCREMENT PRIMARY KEY,
DocumentID BIGINT,
AddressID BIGINT,
PersonID BIGINT,
ContactID BIGINT,
Pwd VARCHAR(16) NOT NULL
);


ALTER TABLE Complainer 
ADD CONSTRAINT fkComplainerPersonID FOREIGN KEY(PersonID) REFERENCES Person(PersonID);

ALTER TABLE Complainer 
ADD CONSTRAINT fkComplainerAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

ALTER TABLE Complainer 
ADD CONSTRAINT fkComplainerContactID FOREIGN KEY(ContactID) REFERENCES Contact(ContactID);

CREATE TABLE Complainer_document(
DocumentID BIGINT AUTO_INCREMENT PRIMARY KEY,
ComplainerID BIGINT,
DocumentType VARCHAR(70) NOT NULL,
DocumentImage VARBINARY(160) NOT NULL,
Description VARCHAR(100) NULL,
UploadDateTime DATETIME NOT NULL
);
ALTER TABLE Complainer_document 
ADD CONSTRAINT fkComplainerDocumentID FOREIGN KEY(ComplainerID) REFERENCES Complainer(ComplainerID);

/* TABLE FOR Complain*/

CREATE TABLE Complain(
ComplainID BIGINT AUTO_INCREMENT PRIMARY KEY,
ComplainerID BIGINT,

EvidenceID BIGINT,

PoliceID BIGINT,
ComplainLawID BIGINT,
Description VARCHAR(100) NULL,
ComplainDateTime Datetime NOT NULL
);



ALTER TABLE Complain 
ADD CONSTRAINT fkComplainComplainerID FOREIGN KEY(ComplainerID) REFERENCES Complainer(ComplainerID);

ALTER TABLE Complain 
ADD CONSTRAINT fkComplainCrimeVictimID FOREIGN KEY(CrimeVictimID) REFERENCES CrimeVictim(CrimeVictimID);

ALTER TABLE Complain 
ADD CONSTRAINT fkComplainEvidenceID FOREIGN KEY(EvidenceID) REFERENCES CrimeEvidence(EvidenceID);

ALTER TABLE Complain 
ADD CONSTRAINT fkComplainCrimeSuspectID FOREIGN KEY(CrimeSuspectID) REFERENCES CrimeSuspect(CrimeSuspectID);

ALTER TABLE Complain 
ADD CONSTRAINT fkComplainPoliceID FOREIGN KEY(PoliceID) REFERENCES Police(PoliceID);
/*
ALTER TABLE Complain 
ADD CONSTRAINT fkComplainComplainLawID FOREIGN KEY(ComplainLawID) REFERENCES ComplainLaw(ComplainLawID);
*/
CREATE TABLE ComplainSuspect(
ComplainSuspectID BIGINT AUTO_INCREMENT PRIMARY KEY,
ComplainerID BIGINT,
CrimeSuspectID BIGINT,
Descripation varchar(200)
);
ALTER TABLE  ComplainSuspect
ADD CONSTRAINT fkComplainSuspectComplainID FOREIGN KEY(ComplainerID) REFERENCES Complain(ComplainerID);
ALTER TABLE ComplainSuspect 
ADD CONSTRAINT fkComplainCrimeSuspectID FOREIGN KEY(CrimeSuspectID) REFERENCES CrimeSuspect(CrimeSuspectID);

CREATE TABLE ComplainVictim(
ComplainSuspectID BIGINT AUTO_INCREMENT PRIMARY KEY,
ComplainerID BIGINT,
CrimeVictimID BIGINT,
Descripation varchar(200)
);
ALTER TABLE  ComplainVictim
ADD CONSTRAINT fkComplainVictimtComplainID FOREIGN KEY(ComplainerID) REFERENCES Complain(ComplainerID);
ALTER TABLE ComplainVictim 
ADD CONSTRAINT fkComplainVictimSuspectID FOREIGN KEY(CrimevictimID) REFERENCES CrimeVictim(CrimevictimID);

CREATE TABLE ComplainEvidence(
ComplainSuspectID BIGINT AUTO_INCREMENT PRIMARY KEY,
ComplainerID BIGINT,
CrimeEvidenceID BIGINT,
Descripation varchar(200)
);
ALTER TABLE  ComplainEvidence
ADD CONSTRAINT fkComplainEvidenceComplainID FOREIGN KEY(ComplainerID) REFERENCES Complain(ComplainerID);
ALTER TABLE ComplainEvidence 
ADD CONSTRAINT fkComplainEvidenceSuspectID FOREIGN KEY(CrimeEvidenceID) REFERENCES CrimeEvidence(EvidenceID);



/* Complain law table */

CREATE TABLE ComplainLaw(
ComplainLawID BIGINT AUTO_INCREMENT PRIMARY KEY,
LawID BIGINT,
ComplainID BIGINT
);


ALTER TABLE ComplainLaw 
ADD CONSTRAINT fkComplainLawID FOREIGN KEY(LawID) REFERENCES LawAct(LawID);

ALTER TABLE ComplainLaw 
ADD CONSTRAINT fkComplainLawComplainID FOREIGN KEY(ComplainID) REFERENCES Complain(ComplainID);

/*  TABLE FOR CRIMINAL  */

CREATE TABLE Criminal(
CriminalID BIGINT AUTO_INCREMENT PRIMARY KEY,
PersonID BIGINT,

ContactID BIGINT,
AddressID BIGINT,
Height FLOAT NULL,
Weight FLOAT NULL,
Type VARCHAR(20) NOT NULL
);



ALTER TABLE Criminal 
ADD CONSTRAINT fkCriminalPersonID FOREIGN KEY(PersonID) REFERENCES Person(PersonID);

ALTER TABLE Criminal 
ADD CONSTRAINT fkCriminalAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

ALTER TABLE Criminal 
ADD CONSTRAINT fkCriminalContactID FOREIGN KEY(ContactID) REFERENCES Contact(ContactID);

CREATE TABLE Criminal_document(
DocumentID BIGINT AUTO_INCREMENT PRIMARY KEY,
CriminalID BIGINT,
DocumentType VARCHAR(70) NOT NULL,
DocumentImage VARBINARY(160) NOT NULL,
Description VARCHAR(100) NULL,
UploadDateTime DATETIME NOT NULL
);
ALTER TABLE Criminal_document 
ADD CONSTRAINT fkCriminalDocumentID FOREIGN KEY(CriminalID) REFERENCES Criminal(CriminalID);

/* TABLE FOR PRISON */

CREATE TABLE Prison(
PrisonID BIGINT AUTO_INCREMENT PRIMARY KEY,
PoliceID BIGINT,
AddressID BIGINT,
PrisonName VARCHAR(20) NOT NULL
);




ALTER TABLE Prison 
ADD CONSTRAINT fkPrisonPoliceID FOREIGN KEY(PoliceID) REFERENCES Police(PoliceID);

ALTER TABLE Prison 
ADD CONSTRAINT fkPrisonAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

/* TABLE FOR PRISIONING TYPE */

CREATE TABLE PrisoningType(
PrisoningTypeID BIGINT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(50) NOT NULL
);





/* TABLE FOR PRISONERS */

CREATE TABLE Prisoners(
PrisonerID BIGINT AUTO_INCREMENT PRIMARY KEY,
CrimeID BIGINT,
CriminalID BIGINT,
PrisoningTypeID BIGINT,
PrisonID BIGINT,

PrisioningStartDate DATE NOT NULL,
PrisioningEndDate DATE NOT NULL,
PrisonStatus VARCHAR(30) NOT NULL
);



ALTER TABLE Prisoners 
ADD CONSTRAINT fkPrisonersCrimeID FOREIGN KEY(CrimeID) REFERENCES Crime(CrimeID);

ALTER TABLE Prisoners 
ADD CONSTRAINT fkPrisonersCriminalID FOREIGN KEY(CriminalID) REFERENCES Criminal(CriminalID);

ALTER TABLE Prisoners 
ADD CONSTRAINT fkPrisonersPrisioningTypeID FOREIGN KEY(PrisoningTypeID) REFERENCES PrisoningType(PrisoningTypeID);

ALTER TABLE Prisoners 
ADD CONSTRAINT fkPrisonersPrisonID FOREIGN KEY(PrisonID) REFERENCES Prison(PrisonID);

/*
ALTER TABLE Prisoners 
ADD CONSTRAINT fkPrisonersLawID FOREIGN KEY(PrisonerLawID) REFERENCES PrisonerLaw(PrisonerLawID);
*/
/* Prisoners law table */

CREATE TABLE PrisonerLaw(
PrisonerLawID BIGINT AUTO_INCREMENT PRIMARY KEY,
LawID BIGINT,
PrisonerID BIGINT
);


ALTER TABLE PrisonerLaw 
ADD CONSTRAINT fkPrisonerLawID FOREIGN KEY(LawID) REFERENCES LawAct(LawID);

ALTER TABLE PrisonerLaw 
ADD CONSTRAINT fkPrisonerLawPrisonerID FOREIGN KEY(PrisonerID) REFERENCES Prisoners(PrisonerID);

/* TABLE FOR WORKER */

CREATE TABLE Worker(
WorkerID BIGINT AUTO_INCREMENT PRIMARY KEY,
DateOfJoining Date NOT NULL,
DateOfResign Date NOT NULL,

AddressID BIGINT,
PersonID BIGINT,
ContactID BIGINT
);



ALTER TABLE Worker 
ADD CONSTRAINT fkWorkerPersonID FOREIGN KEY(PersonID) REFERENCES Person(PersonID);

ALTER TABLE Worker 
ADD CONSTRAINT fkWorkerAddressID FOREIGN KEY(AddressID) REFERENCES Addresses(AddressID);

ALTER TABLE Worker 
ADD CONSTRAINT fkWorkerContactID FOREIGN KEY(ContactID) REFERENCES Contact(ContactID);


CREATE TABLE Worker_document(
DocumentID BIGINT AUTO_INCREMENT PRIMARY KEY,
WorkerID BIGINT,
DocumentType VARCHAR(70) NOT NULL,
DocumentImage VARBINARY(160) NOT NULL,
Description VARCHAR(100) NULL,
UploadDateTime DATETIME NOT NULL
);
ALTER TABLE Worker_document 
ADD CONSTRAINT fkWorkerDocumentID FOREIGN KEY(WorkerID) REFERENCES Worker(WorkerID);

/* TABLE FORM VERIFICATION */

CREATE TABLE FormVerification(
FormVerificationID BIGINT AUTO_INCREMENT PRIMARY KEY,
ComplainerID BIGINT,
PoliceID BIGINT,
WorkerID BIGINT,
ApplayDate DATE NOT NULL,
VerifyDate DATETIME NOT NULL,
Status VARCHAR(20) NOT NULL
);




ALTER TABLE FormVerification 
ADD CONSTRAINT fkFormVerificationComplainerID FOREIGN KEY(ComplainerID) REFERENCES Complainer(ComplainerID);


ALTER TABLE FormVerification 
ADD CONSTRAINT fkFormVerificationPoliceID FOREIGN KEY(PoliceID) REFERENCES Police(PoliceID);

ALTER TABLE FormVerification 
ADD CONSTRAINT fkFormVerificationWorkerID FOREIGN KEY(WorkerID) REFERENCES Worker(WorkerID);
