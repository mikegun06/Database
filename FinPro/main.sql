CREATE DATABASE finpro
USE finpro

CREATE TABLE FsCustomer (
    CustomerId CHAR(8) NOT NULL,
    CustomerName VARCHAR(50) NOT NULL,
    CustomerEmail VARCHAR(40) NOT NULL,
    CustomerPhone NUMERIC,
    CustomerDOB DATE,
    CustomerAddress VARCHAR(50),
    PRIMARY KEY (CustomerId),
    CONSTRAINT CustomerId CHECK (CustomerId LIKE '[C][U][A-Z][A-Z][0-9][0-9][0-9][0-9]')
);

CREATE TABLE FsStaff (
    StaffId CHAR(6) NOT NULL,
    StaffName VARCHAR(50) NOT NULL,
    StaffEmail VARCHAR(40) NOT NULL,
    StaffDOB DATE,
    StaffGender CHAR(10) NOT NULL,
    StaffAddress VARCHAR(50) NOT NULL,
    StaffPosition VARCHAR(30) NOT NULL,
    StaffSalary NUMERIC,
    PRIMARY KEY (StaffId),
    CONSTRAINT StaffId CHECK (StaffId LIKE '[S][T][0-9][0-9][0-9][0-9]')
);

CREATE TABLE FsTeacher (
    TeacherId CHAR(6) NOT NULL,
    TeacherEmail VARCHAR(50) NOT NULL,
    TeacherName VARCHAR(30) NOT NULL,
    TeacherAddress VARCHAR(50) NOT NULL,
    TeacherDOB DATE,
    TeacherDescription VARCHAR(MAX),
    TeacherIncome NUMERIC(12),
    PRIMARY KEY (TeacherId),
    CONSTRAINT TeacherId CHECK (TeacherId LIKE '[T][C][A-Z][0-9][0-9][0-9]')
);

CREATE TABLE FsTransaction (
    TransactionId CHAR(8) NOT NULL,
    TransactionDate DATE,
    CustomerId CHAR(8) NOT NULL,
    ClassId CHAR(7),
    SeminarId CHAR(8),
    OnsiteId CHAR(7),
    PaymentTypeId CHAR(5) NOT NULL,
    PRIMARY KEY (TransactionId),
    CONSTRAINT TransactionId CHECK (TransactionId LIKE '[T][R][A-Z][A-Z][0-9][0-9][0-9][0-9]'),
    FOREIGN KEY (CustomerId) REFERENCES FsCustomer(CustomerId),
    FOREIGN KEY (ClassId) REFERENCES FsClass(ClassId),
    FOREIGN KEY (SeminarId) REFERENCES FsSeminar(SeminarId),
    FOREIGN KEY (OnsiteId) REFERENCES FsOnsite(OnsiteId),
    FOREIGN KEY (PaymentTypeId) REFERENCES FsPaymentType(PaymentTypeId)
);

CREATE TABLE HeaderTable (
    TransactionId CHAR(8) NOT NULL,
    CustomerId CHAR(8) NOT NULL,
    StaffId CHAR(6) NOT NULL,
    TeacherId CHAR(6) NOT NULL,
    PRIMARY KEY (TransactionId),
    FOREIGN KEY (TransactionId) REFERENCES FsTransaction(TransactionId)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CustomerId) REFERENCES FsCustomer(CustomerId)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (TeacherId) REFERENCES FsTeacher(TeacherId)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (StaffId) REFERENCES FsStaff(StaffId)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE FsPaymentType (
    PaymentTypeId CHAR(5) NOT NULL,
    PaymentTypeName VARCHAR(20) NOT NULL,
    PRIMARY KEY (PaymentTypeId),
    CONSTRAINT PaymentTypeId CHECK (PaymentTypeId LIKE '[P][T][0-9][0-9][0-9]')
);

-- CREATE TABLE HistoryPayment (
--     TransactionId CHAR(8) NOT NULL,
--     CustomerId CHAR(8) NOT NULL,
--     ClassId CHAR(7) NOT NULL,
--     TransactionDate DATE,
--     PaymentTypeName VARCHAR(30),
--     FOREIGN KEY (TransactionId) REFERENCES FsTransaction(TransactionId)
--     ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (CustomerId) REFERENCES FsCustomer(CustomerId)
--     ON UPDATE CASCADE ON DELETE CASCADE,
--     FOREIGN KEY (ClassId) REFERENCES FsClass(ClassId)
--     ON UPDATE CASCADE ON DELETE CASCADE
-- );

CREATE TABLE FsClass (
    ClassId CHAR(7) NOT NULL,
    ClassName CHAR(30) NOT NULL,
    TeacherId CHAR(6) NOT NULL,
    DescriptionFill VARCHAR(MAX),
    Price NUMERIC(8),
    PRIMARY KEY (ClassId),
    CONSTRAINT ClassId CHECK (ClassId LIKE '[C][S][A-Z][A-Z][0-9][0-9][0-9]'),
    FOREIGN KEY (TeacherId) REFERENCES FsTeacher (TeacherId)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE FsClassMaterial (
    ClassId CHAR(7) NOT NULL,
    ClassMaterialId CHAR(8) NOT NULL,
    ClassMaterialName VARCHAR(50),
    ClassSubScore NUMERIC(3),
    PRIMARY KEY (ClassMaterialId),
    CONSTRAINT ClassMaterialId CHECK (ClassMaterialId LIKE '[C][M][A-Z][A-Z][0-9][0-9][0-9][0-9]'),
    FOREIGN KEY (ClassId) REFERENCES FsClass (ClassId)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE FsDiscussion (
    DiscussionId CHAR(8) NOT NULL,
    ClassId CHAR(7) NOT NULL,
    CustomerId CHAR(8) NOT NULL,
    TeacherId CHAR(6) NOT NULL,
    UploadDate DATE,
    DiscussionFill VARCHAR(MAX),
    PRIMARY KEY (DiscussionId),
    CONSTRAINT DiscussionId CHECK (DiscussionId LIKE '[D][C][A-Z][A-Z][0-9][0-9][0-9][0-9]')
);

CREATE TABLE FsQuiz (
    ClassId CHAR(6) NOT NULL,
    QuizId CHAR(8) NOT NULL,
    TeacherId CHAR(6) NOT NULL,
    CustomerId CHAR(8) NOT NULL,
    QuizQuestion VARCHAR(MAX),
    QuizScore NUMERIC(3) NOT NULL,
    PRIMARY KEY (QuizId),
    CONSTRAINT QuizId CHECK (QuizId LIKE '[Q][Z][A-Z][0-9][0-9][0-9]'),
    FOREIGN KEY (TeacherId) REFERENCES FsTeacher(TeacherId)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE FsSeminar (
    SeminarId CHAR(8) NOT NULL,
    TeacherId CHAR(6) NOT NULL,
    SeminarTitle VARCHAR(50) NOT NULL,
    SeminarPlatform VARCHAR(20) NOT NULL,
    SeminarDate DATE,
    TotalQuota NUMERIC(4) NOT NULL,
    Price NUMERIC(7) NOT NULL,
    PRIMARY KEY (SeminarId),
    CONSTRAINT SeminarId CHECK (SeminarId LIKE '[S][M][A-Z][A-Z][0-9][0-9][0-9][0-9]'),
    FOREIGN KEY (TeacherId) REFERENCES FsTeacher(TeacherId)
    ON UPDATE CASCADE ON DELETE CASCADE
);
SELECT * from FsSeminar
CREATE TABLE FsOnsite (
    OnsiteId CHAR(7) NOT NULL,
    TeacherId CHAR(6) NOT NULL,
    CustomerId CHAR(8) NOT NULL,
    ClassId CHAR(7) NOT NULL,
    DateOnsite DATE,
    Price NUMERIC(8),
    PRIMARY KEY (OnsiteId),
    CONSTRAINT OnsiteId CHECK (OnsiteId LIKE '[O][N][A-Z][0-9][0-9][0-9][0-9]'),
    FOREIGN KEY (TeacherId) REFERENCES FsTeacher(TeacherId)
    ON UPDATE CASCADE ON DELETE CASCADE
);