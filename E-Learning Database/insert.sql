USE finpro

INSERT INTO FsCustomer VALUES (
    'CUNH0013' ,'Naomi Hinata' ,'naohin@gmail.com' ,085195841100 ,'1994-03-26', 'Jl. Bali 32'
)
INSERT INTO FsCustomer VALUES (
    'CUJN0004' ,'Jenson Nathaniel' ,'jenson_nat5@yahoo.com' ,081378934567 , '2000-05-14', NULL
)
INSERT INTO FsCustomer VALUES (
    'CUHM0008' ,'Hansen Muhammad' ,'muh.hansen10@gmail.com' ,087715503388 , NULL, NULL
)
SELECT * FROM FsCustomer

INSERT INTO FsStaff VALUES (
    'ST0170', 'Kalin Yohan', 'kalyn0@gmail.com', '1987-08-17', 'F', 'Jl. Pegangsaan Timur 55', 'Manager', 8000000
)
INSERT INTO FsStaff VALUES (
    'ST0027', 'Juan Polan', 'juannn88@icloud.com', '1992-11-01', 'M', 'Jl. Semarang 16', 'Accounting', 4500000
)
INSERT INTO FsStaff VALUES (

    'ST0068', 'Fanny Winata', 'faniwin05@yahoo.com', '1994-07-20', 'F', 'Jl. Biliton 72', 'CustomerService:Email', 3500000
)
SELECT * FROM FsStaff

INSERT INTO FsTeacher VALUES (
    'TCL007' ,'lanijuanita72@gmail.com' ,'Lani Juanita' ,'Jl. Kalijudan 21' , '1990-04-25', 'Memiliki pengalaman kerja di bidang marketing selama 4 tahun di SCARLETT', 10000000
)
INSERT INTO FsTeacher VALUES (
    'TCC013' ,'colinker@gmail.com' ,'Colin Kerkis' ,'Jl. Cokroaminoto 62' , '1987-07-13', 'Menjabat sebagai CTO di perusahaan teknologi, Full-Stack Developer', 10000000
)
-- INSERT INTO FsTeacher VALUES (
--     'TCL004' ,'leojins93@gmail.com' ,'Leonard Jins' ,'Jl. Untung Suropati 5' , 07/05/1993, 10000000
-- )
SELECT * FROM FsTransaction

INSERT INTO FsTransaction VALUES (
    'TRAD0105' ,'2020-07-10' ,'CUHM0008' ,'CSWD004' ,NULL, Null, 'PT005' 
)
INSERT INTO FsTransaction VALUES (
    'TRFC0043' ,'2020-09-24' ,'CUJN0004' ,'CSAF005' ,NULL, Null,'PT005' 
)
INSERT INTO FsTransaction VALUES (
    'TRJK0379' ,'2020-03-05' ,'CUNH0013' ,'CSMG029' ,NULL, Null,'PT004' 
)
INSERT INTO FsTransaction VALUES (
    'TRKL1902' ,'2021-03-05' ,'CUHM0008' ,NULL , 'SMMJ0302', NULL, 'PT005' 
)
SELECT * FROM HeaderTable

INSERT INTO HeaderTable VALUES (
    'TRAD0105', 'CUHM0008', 'ST0068', 'TCC013'
)
INSERT INTO HeaderTable VALUES (
    'TRFC0043', 'CUJN0004', 'ST0068', 'TCC013'
)
INSERT INTO HeaderTable VALUES (
    'TRJK0379','CUNH0013', 'ST0068', 'TCL007'
)
INSERT INTO HeaderTable VALUES (
    'TRKL1902', 'CUHM0008', 'ST0068', 'TCC013'
)

INSERT INTO FsPaymentType VALUES (
    'PT004' ,'Credit Card' 
)
INSERT INTO FsPaymentType VALUES (
    'PT005' ,'QRIS' 
)
INSERT INTO FsPaymentType VALUES (
    'PT002' ,'Debit' 
)
SELECT * FROM FsPaymentType
-- INSERT INTO HistoryPayment VALUES (
--     'TRAD0105' ,'CU' ,'CS' ,20/8/2020 ,'Credit'
-- )
-- INSERT INTO HistoryPayment VALUES (
--     'TRFC0043' ,'CU' ,'CS' ,20/8/2020 ,'Credit'
-- )
-- INSERT INTO HistoryPayment VALUES (
--     'TRJK0379' ,'CU' ,'CS' ,20/8/2020 ,'Credit'
-- )

INSERT INTO FsClass VALUES (
    'CSWD004', 'Web Development', 'TCC013', 'Kalian akan mempelajari bagaimana membuat sebuah web dari awal', 699000
)
INSERT INTO FsClass VALUES (
    'CSMG029', 'Marketing 101', 'TCL007', 'Bagaimana orang akan membeli produk kita tanpa harus berpikir berkali-kali, temukan jawabannya di kelas ini!!!', 799000
)
INSERT INTO FsClass VALUES (
    'CSAF005', 'Algebra from Scratch', 'TCC013', 'Susah mengerjakan soal matematika, saya akan bantu anda mengerti semuanya dalam beberapa hari saja', 299000
)
SELECT * FROM FsClass

INSERT INTO FsClassMaterial VALUES (
    'CSWD004', 'CMWD1001', 'Session 1 : Apa itu Web?', NULL
)
INSERT INTO FsClassMaterial VALUES (
    'CSMG029', 'CMMG1001', 'Session 1 : Basic Marketing', NULL
)
INSERT INTO FsClassMaterial VALUES (
    'CSAF005', 'CMAF1001', 'Session 1 : Overview of Algebra', NULL
)
SELECT * FROM FsDiscussion

INSERT INTO FsDiscussion VALUES (
    'DCRG0189', 'CSAF005', 'CUJN0004', 'TCC013', '2020-09-27', 'Bagaimana kurva dari f(x)=3x-y?'
)
INSERT INTO FsDiscussion VALUES (
    'DCHY0038', 'CSWD004', 'CUHM0008', 'TCC013', '2020-07-21', 'Perbedaan antara if else dan else if?'
)
INSERT INTO FsDiscussion VALUES (
    'DCLF1007','CSMG029' ,'CUNH0013', 'TCL007', '2020-03-21', 'Contoh copywriting yang baik seperti apa?'
)

INSERT INTO FsQuiz VALUES (
    'CSWD004', 'QZA102', 'TCC013', 'Buatlah sebuah looping sederhana dengan Javascript', 93
)
INSERT INTO FsQuiz VALUES (
    'CSMG029', 'QZD303', 'TCL007', 'Apa yang dimaksud dengan CMO dan CCO', 88
)
INSERT INTO FsQuiz VALUES (
    'CSAF005', 'QZH406', 'TCC013', 'Buatlah kurva f(x) = 4x^2', 90
)
SELECT * FROM FsQuiz
INSERT INTO FsSeminar VALUES (
    'SMMJ0302', 'TCC013', 'Mastering Javascript', 'Zoom', '2021-03-18', 150, 399000
)
INSERT INTO FsSeminar VALUES (
    'SMSM0145', 'TCL007', 'Social Media Blueprint', 'Zoom', '2021-04-07', 125, 399000
)
INSERT INTO FsSeminar VALUES (
    'SMKF0038', 'TCC013', 'Kotlin for All', 'Zoom', '2021-03-25', 200, 399000
)
SELECT * FROM FsSeminar

INSERT INTO FsOnsite VALUES (
    'ONF0027', 'TCL007', 'CUNH0013', 'CSMG029','2022-02-20' ,499000
)
INSERT INTO FsOnsite VALUES (
    'ONJ0122', 'TCC013', 'CUJN0004', 'CSAF005','2022-02-28' ,499000
)
INSERT INTO FsOnsite VALUES (
    'ONL0092', 'TCL007', 'CUNH0013', 'CSMG029','2022-02-28' ,499000
)
SELECT * FROM FsOnsite
