
CREATE TABLE Employees 
( 
    Id int, 
    Name varchar(50) not null, 
    Photo varbinary(max) not null 
) 

INSERT INTO Employees (Id, Name, Photo) 
SELECT 10, 'John', 
BulkColumn from Openrowset( Bulk 'E:\Duplicate File Finder Application_3.5.exe', Single_Blob) 
as EmployeePicture 

select * from Employees
select LEN(photo) from Employees

UPDATE Employees SET [Photo] = 
(SELECT MyImage.* from 
Openrowset(Bulk 'E:\Duplicate File Finder Application_3.5.exe', Single_Blob) MyImage) 
where Id = 10

