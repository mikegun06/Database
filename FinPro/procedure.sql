USE finpro

CREATE PROC pc1 @klsid CHAR(7)
AS
SELECT ClassName "Class Name", TeacherName "Teacher", TeacherDescription "Teacher Description", DescriptionFill "Class Description", Price, ClassMaterialName "Class Subject" FROM FsClass fc
JOIN FsClassMaterial fcm ON fc.ClassId = fcm.ClassId
JOIN FsTeacher ft ON fc.TeacherId = ft.TeacherId
WHERE fc.ClassId = @klsid
EXEC pc1 "CSWD004"
select * from FsClass

CREATE PROC pc2 @id CHAR(8), @nama VARCHAR(30), @dob DATE, @almt VARCHAR(50), @telp NUMERIC(13)
AS
BEGIN
    IF EXISTS (SELECT CustomerId FROM FsCustomer where CustomerId=@id)
        BEGIN
            UPDATE FsCustomer
            SET CustomerId=@id,
			CustomerName=@nama, CustomerDOB=@dob, CustomerAddress=@almt,CustomerPhone=@telp
			WHERE CustomerId=@id
		END
	ELSE
		PRINT 'Customer does not exists';
	END
EXEC pc2 "CUHM0008", "Hansen M", NULL, NULL, NULL
select * from FsCustomer

CREATE PROC pc3 @id CHAR(8), @nama VARCHAR(30),@email VARCHAR(30), @almt VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT StaffId FROM FsStaff where StaffId=@id)
        BEGIN
            UPDATE FsStaff
            SET StaffId=@id,
			StaffName=@nama, StaffEmail=@email, StaffAddress=@almt
			WHERE StaffId=@id
		END
	ELSE
		PRINT 'Staff does not exists';
	END
EXEC pc3 "ST0068", "Fanny Winata", "faniwinata@gmail.com", "Jl. Mulyosari Prima 10"
select * from FsStaff

CREATE PROC pc4 @id CHAR(8), @nama VARCHAR(30), @email VARCHAR(30), @almt VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT TeacherId FROM FsTeacher where TeacherId=@id)
        BEGIN
            UPDATE FsTeacher
            SET TeacherId=@id,
			TeacherName=@nama, TeacherEmail=@email, TeacherAddress=@almt
			WHERE TeacherId=@id
		END
	ELSE
		PRINT 'Teacher does not exists';
	END
EXEC pc4 "TCL007", "Lani Juanita", "lanijuanita72@gmail.com", "Jl. Kalijudan 23"
select * from FsTeacher

CREATE PROC tc1 @id CHAR(6), @income NUMERIC(9)
AS
BEGIN
    IF EXISTS(SELECT TeacherId FROM FsTeacher WHERE TeacherId=@id)
        BEGIN
            UPDATE FsTeacher
            set TeacherIncome += @income
            WHERE TeacherId=@id
        END
    ELSE
		PRINT 'Teacher does not exists';
	END
EXEC tc1 "TCC013", 5000000
SELECT * FROM FsTeacher

CREATE PROC st1 @id CHAR(6), @gaji NUMERIC(9)
AS
BEGIN
    IF EXISTS(SELECT StaffId FROM FsStaff WHERE StaffId=@id)
        BEGIN
            UPDATE FsStaff
            set StaffSalary = @gaji
            WHERE StaffId=@id
        END
    ELSE
        PRINT 'Staff does not exists';
    END
EXEC st1 "ST0027", 5000000
SELECT * FROM FsStaff

CREATE PROC pc1 @klsid CHAR(7)
AS
SELECT ClassName "Class Name", TeacherName "Teacher", TeacherDescription "Teacher Description", DescriptionFill "Class Description", Price, ClassMaterialName "Class Subject" FROM FsClass fc
JOIN FsClassMaterial fcm ON fc.ClassId = fcm.ClassId
JOIN FsTeacher ft ON fc.TeacherId = ft.TeacherId
WHERE fc.ClassId = @klsid