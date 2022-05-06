USE finpro

CREATE VIEW CustomerProfile
AS
SELECT CustomerName "Name",CustomerEmail "Email",CustomerPhone "Phone Number",CustomerDOB "Date of Birth",CustomerAddress "Address" FROM FsCustomer
SELECT * FROM CustomerProfile

CREATE VIEW TeacherProfile
AS
SELECT TeacherName "Teacher", TeacherDescription "Description" FROM FsTeacher
WHERE TeacherName LIKE '% %'
SELECT * FROM TeacherProfile

CREATE VIEW TransactionHistoryClass
AS
SELECT TransactionId "Transaction ID", CONVERT(VARCHAR, TransactionDate, 107) "Date", fc.ClassName "Class Name", PaymentTypeName "Payment" FROM FsTransaction ft
JOIN FsPaymentType fpt ON ft.PaymentTypeId = fpt.PaymentTypeId
JOIN FsClass fc ON ft.ClassId = fc.ClassId
SELECT * FROM TransactionHistoryClass

CREATE VIEW TransactionHistorySeminar
AS
SELECT TransactionId "Transaction ID",CONVERT(VARCHAR, TransactionDate, 107) "Date", fs.SeminarTitle "Title", PaymentTypeName "Payment" FROM FsTransaction ft
JOIN FsPaymentType fpt ON ft.PaymentTypeId = fpt.PaymentTypeId
JOIN FsSeminar fs ON ft.SeminarId = fs.SeminarId
SELECT * FROM TransactionHistorySeminar

CREATE VIEW TransactionHistoryOnsite
AS
SELECT TransactionId "Transaction ID",CONVERT(VARCHAR, TransactionDate, 107) "Date", fo.OnsiteId "Onsite ID", PaymentTypeName "Payment" FROM FsTransaction ft
JOIN FsPaymentType fpt ON ft.PaymentTypeId = fpt.PaymentTypeId
JOIN FsOnsite fo ON ft.OnsiteId = fo.OnsiteId
SELECT * FROM TransactionHistoryOnsite

CREATE VIEW ClassView
AS
SELECT ClassName "Class Name", TeacherName "Teacher", TeacherDescription "Teacher Description", DescriptionFill "Class Description", Price, ClassMaterialName "Class Subject", ClassSubScore "Score" FROM FsClass fc
JOIN FsClassMaterial fcm ON fc.ClassId = fcm.ClassId
JOIN FsTeacher ft ON fc.TeacherId = ft.TeacherId
SELECT * FROM ClassView

CREATE VIEW ClassQuiz
AS
SELECT ClassName "Class Name", TeacherName "Teacher", QuizQuestion "Question", QuizScore "Score" FROM FsQuiz fq
JOIN FsClass fc ON fq.ClassId = fc.ClassId
JOIN FsTeacher ft ON fq.TeacherId = ft.TeacherId
SELECT * FROM ClassQuiz

CREATE VIEW SeminarSchedule
AS
SELECT SeminarTitle "Title", TeacherName "Teacher Name", SeminarPlatform "Seminar Platform", CONVERT(VARCHAR, SeminarDate, 107) "Date", TotalQuota "Quota", Price, RegistrationLink "Form Link" FROM FsSeminar fs
JOIN FsTeacher ft ON fs.TeacherId = ft.TeacherId
SELECT * FROM SeminarSchedule

CREATE VIEW OnsiteSchedule
AS
SELECT 'Onsite ' + RIGHT(OnsiteId,5) "Onsite ID", TeacherName "Teacher Name", ClassName "Class Name", CONVERT(VARCHAR, DateOnsite, 107) "Date", fo.Price FROM FsOnsite fo
JOIN FsTeacher ft ON fo.TeacherId = ft.TeacherId
JOIN FsClass fc ON fo.ClassId = fc.ClassId
SELECT * FROM OnsiteSchedule


