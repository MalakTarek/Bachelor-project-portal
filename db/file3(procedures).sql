--every procedure has a sample of execution(s) to be able to test all possible cases for each procedure
--there is a go between every 2 procedures that have to be commented first before running
--the executions are commented before each procedure
--this was done on visual studio 2022(so the syntax might be different than later versions with , and ;)
CREATE PROCEDURE GenerateRandomPassword
@pass VARCHAR(10) OUTPUT 
AS   
BEGIN  
SET NOCOUNT ON  
declare @LENGTH INT,@CharPool varchar(26),@PoolLength varchar(26),@LoopCount  INT  
DECLARE @RandomString VARCHAR(10),@CHARPOOLINT VARCHAR(9)  
  
    
SET @CharPool = 'A!B@C!D#E@FG#H$IJ$K%LM%N*PQR%ST&U*V(W)X_YZ'  
DECLARE @TMPSTR VARCHAR(3)  

SET @PoolLength = DataLength(@CharPool)  
SET @LoopCount = 0  
SET @RandomString = ''  
  
    WHILE (@LoopCount <10)  
    BEGIN  
        SET @TMPSTR =   SUBSTRING(@Charpool, CONVERT(int, RAND() * @PoolLength), 1)           
        SELECT @RandomString  = @RandomString + CONVERT(VARCHAR(5), CONVERT(INT, RAND() * 10))  
        IF(DATALENGTH(@TMPSTR) > 0)  
        BEGIN   
            SELECT @RandomString = @RandomString + @TMPSTR    
            SELECT @LoopCount = @LoopCount + 1  
        END  
    END  
    SET @LOOPCOUNT = 0    
    SET @pass=@RandomString  
END
GO;
--drop proc UserRegister
--declare @password varchar(10) ,
--@user_id INT 
--execute UserRegister 'company','meo','meo.com',null,null,null,null,null,null,null,null,'okay','mrmeow','yum.com',null,'egy',@password output,@user_id output
CREATE PROCEDURE UserRegister
@usertype varchar(20),
@userName varchar(20),
@email varchar(50),             
@first_name varchar(20)= null,
@last_name varchar(20) = null,
@birth_date datetime = null,
@GPA decimal(3,2)= null,
@semester int = null,
@address varchar(100) = null, 
@faculty_code varchar(10)= null,
@major_code varchar(10) = null, 
@company_name varchar(20)= null,
@representative_name varchar(20)= null, 
@representative_email varchar(50)= null,
@phone_number varchar(20)= null,
@country_of_residence varchar(20)= null,
@password varchar(10) OUTPUT ,
@user_id INT OUTPUT
AS
EXECUTE GenerateRandomPassword @password OUTPUT
INSERT INTO dbo.users ( Role,Username,  Email,phone_Number ,Password)
VALUES (@usertype, @userName, @email ,@phone_number,@password);
SELECT @user_id=user_id ,@password= Password
FROM dbo.users
Where Email = @email

If @usertype = 'Student'
begin
INSERT INTO dbo.Student(sid, first_name , last_name ,Date_Of_Birth ,GPA,Semester,Address,Major_code)
VALUES (@user_id,@first_name, @last_name , @birth_date ,@GPA ,@semester,@address,@major_code);
end
else if @usertype = 'Company'
begin
INSERT INTO dbo.company(company_id,name , Representative_name,Representative_Email,location)
VALUES (@user_id,@company_name,@representative_name, @representative_email,@country_of_residence);
end
else if @usertype = 'Lecturer'
begin
INSERT into lecturer(lecturer_id)
VAlues(@user_id)
INSERT INTO dbo.Faculty(Faculty_code,Dean)
VALUES (@faculty_code,@user_id)
end
else if @usertype ='TA'
begin
insert into dbo.Teaching_Assistant(TA_id)values(@user_id)
end
else if @usertype ='External Examiner'
begin
insert into dbo.External_Examiner(EE_id)values(@user_id)
end
else if @usertype ='Coordinator'
begin
insert into dbo.Coordinator(coordinator_id)values(@user_id)
end
SELECT user_id , Password
FROM dbo.users
Where Email = @email

GO;
Create Procedure IsStudent
@id int , @success bit output
as
if exists(select sid from dbo.Student where sid = @id)
begin
set @success =1;
end
else
begin
set @success=0;
end

go;

Create Procedure IsLecturer
@id int , @success bit output
as
if exists(select lecturer_id from dbo.lecturer where lecturer_id = @id)
begin
set @success =1;
end
else
begin
set @success=0;
end

go;

Create Procedure IsCoordinator
@id int , @success bit output
as
if exists(select coordinator_id from dbo.Coordinator where coordinator_id = @id)
begin
set @success =1;
end
else
begin
set @success=0;
end

go;

Create Procedure IsTA
@id int , @success bit output
as
if exists(select TA_id from dbo.Teaching_Assistant where TA_id = @id)
begin
set @success =1;
end
else
begin
set @success=0;
end

go;

Create Procedure IsExternalExaminer
@id int , @success bit output
as
if exists(select EE_id from dbo.External_Examiner where EE_id = @id)
begin
set @success =1;
end
else
begin
set @success=0;
end

go;
--declare @success bit 
--declare @user_id int
--execute  UserLogin 'malak@cato.com','1234', @success output, @user_id output
--print @success 
--print @user_id
--go 
CREATE PROCEDURE UserLogin
@email varchar(50), 
@password varchar(10),
@success bit output ,@user_id int output
AS
set @success  = 0;
set @user_id = -1;
IF EXISTS
(
     SELECT user_id FROM dbo.users
    WHERE Email=@email and Password =@password 
)
BEGIN
SET @success = 1
Select @user_id = user_id FROM dbo.users
    WHERE Email=@email and Password =@password 
END
else
begin
print 'user not found'
set @user_id = -1
 end   

GO;
--execute ViewProfile 1
--go
CREATE PROCEDURE ViewProfile
@user_id int
AS
select * from dbo.users 
where user_id= @user_id
GO;
--execute ViewBachelorProjects null , 2 (run procedure AssignAllStudentsToLocalProject first to see project assigned to this student)
--execute ViewBachelorProjects null , 4
--execute ViewBachelorProjects null , 1
--execute ViewBachelorProjects null , null
--execute ViewBachelorProjects Academic , 4
--execute ViewBachelorProjects Industrial, 10
--go
CREATE PROCEDURE ViewBachelorProjects
@ProjectType varchar(20),
@User_id int
AS
IF @ProjectType is null and @User_id is null
begin
select * from dbo.Bachelor_Project
END
ELSE IF @ProjectType is null
BEGIN
declare @type varchar(50)
set @type ='null'
if exists(select A.Academic_code from dbo.Academic A inner join dbo.Student S on A.Academic_code = S.Assigned_Project_code
where S.sid = @User_id)
begin
set @type ='Academic'
end
else if exists(select I.Industrial_code from dbo.Industrial I inner join dbo.Student S on I.Industrial_code = S.Assigned_Project_code
where S.sid = @User_id)
begin
set @type ='Industrial'
end
If @type = 'Academic'
begin
select A.* from dbo.Academic A ,dbo.Student S
WHERE S.sid=@User_id and A.Academic_code = S.Assigned_Project_code
end
else if @type = 'Industrial'
begin
select I.* from dbo.Industrial I ,dbo.Student S
where S.sid=@User_id and I.Industrial_code =S.Assigned_Project_code
end
else if @type = 'null'
begin
select * from dbo.Academic 
WHERE L_id = @User_id or EE_id = @User_id or TA_id = @User_id
select * from dbo.Industrial 
where L_id = @User_id or E_id = @User_id or C_id = @User_id
end
end
else If @ProjectType = 'Academic'
begin
select * from dbo.Academic 
WHERE L_id = @User_id or EE_id = @User_id or TA_id = @User_id
end
else if @ProjectType = 'Industrial'
begin
select * from dbo.Industrial 
where L_id = @User_id or E_id = @User_id or C_id = @User_id
end
GO;

--execute MakePreferencesLocalProject 12,'def' ,102
--go
create procedure MakePreferencesLocalProject
@sid int ,
@bachelor_code varchar(10),
@preference_number int
as
insert into dbo.StudentPreferences(sid, PCode, PreferenceNumber)
values (@sid , @bachelor_code , @preference_number)

go;
--execute ViewMyThesis 2,'meow'
--execute ViewMyThesis 3,'meow'
--execute ViewMyThesis 12,'meow'
--go

create procedure ViewMyThesis
@sid  int ,
@title varchar(50)
as
--check type
--check sid n title ,pdf doc
-- grade
--no grade
declare @doc varchar(1000) , @grade decimal(4,2) ,@type varchar(50)
if exists(select Academic_code from dbo.Academic A inner join dbo.Student S on A.Academic_code = S.Assigned_Project_code
where S.sid = @sid)
begin
set @type ='Academic'
end
else 
begin
set @type ='Industrial'
end
select @doc =PDF_doc ,@grade =total_Grade   from dbo.Thesis where sid = @sid and Title = @title
if @doc is null
begin
print 'no pdf submitted'
end
else if @grade is null and @type = 'Academic'
begin
declare @EE decimal(4,2) , @Lec decimal(4,2)
select @EE= EE_grade ,@Lec=lecturer_grade from dbo.GradeAcademicThesis where sid = @sid
set @grade = (@EE +@Lec)/2
update dbo.Thesis set total_Grade = @grade where sid = @sid
select *
from Thesis  where sid = @sid and Title = @title
end
else if  @grade is null and @type = 'Industrial'
begin
declare @E decimal(4,2) , @C decimal(4,2)
select @C= Company_grade ,@E=Employee_grade from dbo.GradeIndustrialThesis where sid = @sid
set @grade = (@C + @E)/2
update dbo.Thesis set total_Grade = @grade where sid = @sid
select *
from Thesis  where sid = @sid and Title = @title
END
else
begin
select *
from Thesis  where sid = @sid and Title = @title
end

go;
--exec SubmitMyThesis 14,'okie','meow by3mel moew'
--go
create procedure SubmitMyThesis
@sid int,
@title varchar(50),
@PDF_Document varchar(1000)
as 
update dbo.Thesis set Title =@title ,PDF_doc=@PDF_Document where sid=@sid
go;
--exec ViewMyProgressReports 2,'2022-12-25'
--exec ViewMyProgressReports 13,null
--go
create procedure ViewMyProgressReports
@sid int ,
@date datetime
as 
--declare @content varchar(1000)
--select @content =Content  from dbo.ProgressReport where sid = @sid 
--if @content is null
--begin 
--print 'no content submitted'
--end
if @date is null 
begin
select * 
from dbo.ProgressReport where sid = @sid order by Date desc
end
else
begin
select * 
from dbo.ProgressReport where sid = @sid and Date = @date
end

go;
--exec ViewMyDefense 2
--exec ViewMyDefense 12
--exec ViewMyDefense 13
--go
create procedure ViewMyDefense
@sid int 
as
--check type
--check sid n title ,pdf doc
-- grade
--no grade
declare @content varchar(1000) , @grade decimal(4,2) ,@type varchar(50)
if exists(select Academic_code from dbo.Academic A inner join dbo.Student S on A.Academic_code = S.Assigned_Project_code
where S.sid = @sid)
begin
set @type ='Academic'
end
else 
begin
set @type ='Industrial'
end
select @content =Content ,@grade =total_Grade  from dbo.Defense where sid = @sid 
if @content is null
begin 
print 'no pdf submitted'
end
else if @grade is null and @type = 'Academic'
begin
declare @EE decimal(4,2) , @Lec decimal(4,2)
select @EE= EE_grade ,@Lec=Lecturer_grade from dbo.GradeAcademicDefense where sid = @sid
set @grade = (@EE +@Lec)/2
update dbo.Defense set total_Grade = @grade where sid = @sid
select *
from dbo.Defense  where sid = @sid 
end
else if  @grade is null and @type = 'Industrial'
begin
declare @E decimal(4,2) , @C decimal(4,2)
select @C= Company_grade ,@E=Employee_grade  from dbo.GradeIndustrialDefense where sid = @sid
set @grade = (@C + @E)/2
update dbo.Defense set total_Grade = @grade where sid = @sid
select *
from dbo.Defense  where sid = @sid
END
else
begin
select * 
from dbo.Defense where sid = @sid
end
go;

 --exec UpdateMyDefense 3 ,'zz'
 --go
create procedure UpdateMyDefense
@sid int,
@defense_content varchar(1000) 
as 
update dbo.Defense set Content = @defense_content 
where sid = @sid

go;
--exec ViewMyBachelorProjectGrade 2
--exec ViewMyBachelorProjectGrade 3
--exec ViewMyBachelorProjectGrade 15
--go;
create procedure ViewMyBachelorProjectGrade
@sid int
as 
declare @bgrade decimal(4,2)
select @bgrade=TotalBachelorGrade
from Student where sid = @sid
declare @thesisGrade decimal(4,2) , @defenseGrade decimal(4,2) , @CPRG decimal(4,2)
select @thesisGrade=T.total_Grade,@defenseGrade=D.total_Grade,@CPRG= R.ComulativeProgressReportGrade
from dbo.Thesis T ,dbo.Defense D , dbo.ProgressReport R where T.sid = @sid and D.sid = @sid and R.sid = @sid
if @thesisGrade is null or @defenseGrade is null or @CPRG is null 
begin
declare @null varchar(5)
set @null ='null'
print @null
end
else if @bgrade is null
begin 
set @bgrade = (0.3*@thesisGrade) + (0.3* @defenseGrade)+ (0.4*@CPRG)
update dbo.Student set TotalBachelorGrade =@bgrade where sid = @sid
select TotalBachelorGrade
from Student where sid = @sid
end
else
begin 
select TotalBachelorGrade
from Student where sid = @sid
end



go;
--exec ViewNotBookedMeetings 3
--go
create procedure ViewNotBookedMeetings
@sid int
as
if exists(select sid from dbo.Student where sid = @sid)
begin
select * from dbo.Meeting mm
where mm.L_id is null 
except
select m.* 
from dbo.Meeting m inner join dbo.MeetingAttendents a on m.Meeting_ID = a.Meeting_ID 
order by mm.Date
end
go;
--exec BookMeeting 3,3
--go
CREATE PROCEDURE BookMeeting
@sid int,
@meeting_id int
as
INSERT INTO dbo.MeetingAttendents Values(@meeting_id,@sid)
go;
--exec ViewMeeting null ,2
--exec ViewMeeting 1 ,2
--go
CREATE PROCEDURE ViewMeeting
@meeting_id int,
@sid int
as 
if @meeting_id is null
begin
select M.* from  dbo.Meeting M inner join dbo.MeetingAttendents A on M.Meeting_ID = A.Meeting_ID
where A.Attendant_id  = @sid
end
else
begin
select M.* ,L.* from  dbo.Meeting M inner join dbo.MeetingAttendents A on M.Meeting_ID = A.Meeting_ID inner join dbo.MeetingToDoList L on M.Meeting_ID = L.Meeting_ID
where A.Attendant_id  = @sid and A.Meeting_ID = @meeting_id
end
go;
--exec StudentAddToDo 3 ,'meows'
--go
CREATE PROCEDURE  StudentAddToDo
@meeting_id int, 
@to_do_list varchar(200)
as
insert into dbo.MeetingToDoList values(@meeting_id,@to_do_list)

go;
--execute AddEmployee 11 , 'meow.com','meow3','12345678','meowscom'
--go
create procedure AddEmployee
@ComapnyID int,
@email varchar(50),
@name varchar(20),
@phone_number varchar(20),
@field varchar(25)
as
declare @password varchar(10)
execute GenerateRandomPassword @password output
insert into dbo.Employee( Company_id, Username, Email, Field, Phone , Password)
values (@ComapnyID , @name , @email , @field , @phone_number,@password)
select Staff_id , Company_id , Password from dbo.Employee
where Company_id = @ComapnyID and Email =@email
go;

--exec CompanyCreateLocalProject 10 ,'Mango','peaches','farm','abc101'
--go
create procedure CompanyCreateLocalProject
@company_id int,
@proj_code varchar(10),
@title varchar(50),
@description varchar(200),
@major_code varchar(10)
as
if exists(select company_id from dbo.company where company_id = @company_id)
begin
insert into dbo.Bachelor_Project(code,Name,Description)
values(@proj_code,@title,@description)
insert into dbo.MajorHasBachelorProject(Major_code,Project_code)
values(@major_code,@proj_code)
end
go;

--exec AssignEmployee 'abc' ,2,11 
--go
create procedure AssignEmployee
@bachelor_code varchar(10),
@staff_id int,
@Company_id int
as
update dbo.Industrial set E_id = @staff_id , C_id = @Company_id
where Industrial_code = @bachelor_code
select * from dbo.Industrial 
where E_id = @staff_id

go;
--exec CompanyGradeThesis 10 , 12,'meow',72
--go
create procedure CompanyGradeThesis
@Company_id int, 
@sid int, 
@thesis_title varchar(50), 
@Company_grade Decimal(4,2)
as 
insert into dbo.GradeIndustrialThesis(C_id, sid, Title, Company_grade)
values (@Company_id , @sid , @thesis_title , @Company_grade)

go;
--exec CompanyGradedefense 11,13,'meow',80
--go
create procedure CompanyGradedefense
@Company_id int,
@sid int,
@defense_location varchar(5), 
@Company_grade Decimal(4,2)
as insert into dbo.GradeIndustrialDefense (C_id, sid, Location, Company_grade)
values (@Company_id, @sid , @defense_location , @Company_grade)
go;
--exec CompanyGradePR 10 , 13,'1999-10-10',65
--go
create procedure CompanyGradePR
@Company_id int,
@sid int,
@date datetime,
@Company_grade decimal(4,2)
as insert into dbo.GradeIndustrialPR(C_id, sid, Date, Company_grade)
values (@Company_id , @sid , @date , @Company_grade)
declare @avg decimal(4,2)
select @avg = Avg(grade)   from dbo.ProgressReport where sid = @sid
update dbo.ProgressReport set ComulativeProgressReportGrade = @avg where sid = @sid
go;
--exec LecturerCreateLocalProject 1,'idk0','help','new','abc101'
--go
CREATE PROCEDURE LecturerCreateLocalProject
@Lecturer_id int, 
@proj_code varchar(10),
@title varchar(50), 
@description varchar(200),
@major_code varchar(10)
as
if exists(select lecturer_id from dbo.lecturer where lecturer_id = @Lecturer_id)
begin
insert into dbo.Bachelor_Project(code,Name,Description)
values(@proj_code,@title,@description)
insert into dbo.MajorHasBachelorProject(Major_code,Project_code)
values(@major_code,@proj_code)
end

go;
--tested in sql file 2 insertions
create procedure SpecifyThesisDeadline
@deadline datetime
as
insert into dbo.Thesis(sid)
 select sid from dbo.Student
 update dbo.Thesis set Deadline=@deadline 
go;
--exec CreateMeeting 1,'1:30','5:45','2020/5/5','barn'
--go
CREATE PROCEDURE  CreateMeeting
@Lecturer_id int,
@start_time time, 
@end_time time, 
@date datetime,
@meeting_point varchar(5)
as
insert into dbo.Meeting(L_id,STime,ETime,Date,Meeting_Point)
Values(@Lecturer_id,@start_time,@end_time,@date,@meeting_point);
go;
--exec LecturerAddToDo 2 ,'newnot0es'
--go
CREATE PROCEDURE LecturerAddToDo
@meeting_id int,
@to_do_list varchar(200)
as
insert into dbo.MeetingToDoList values(@meeting_id,@to_do_list)

go;
--exec ViewMeetingLecturer 4,2
--exec ViewMeetingLecturer 1,null
--go
CREATE PROCEDURE ViewMeetingLecturer
@Lecturer_id int, 
@meeting_id int
as
if @meeting_id is null
begin
select * from dbo.Meeting 
where L_id = @Lecturer_id
end
else
begin
select * from dbo.Meeting
where L_id = @Lecturer_id and Meeting_ID = @meeting_id
end
go;
--exec ViewEE
--go
CREATE PROCEDURE ViewEE
as
select * from dbo.External_Examiner
EXCEPT
select E.* from dbo.External_Examiner E inner join dbo.LecturerRecommendEE R on E.EE_id = R.EE_id
GO;
--exec RecommendEE 4,'def',6
--go
CREATE PROCEDURE  RecommendEE
@Lecturer_id int, 
@proj_code varchar(10), 
@EE_id int
as
insert into dbo.LecturerRecommendEE values(@Lecturer_id,@EE_id,@proj_code)
go;
--exec SuperviseIndustrial 4,'abc'
--go
CREATE PROCEDURE SuperviseIndustrial
@Lecturer_id int, 
@proj_code varchar(10)
as
UPDATE dbo.Industrial SET L_id = @Lecturer_id WHERE Industrial_code = @proj_code;
go;
-- exec LecGradeThesis 1 ,2,'meow',88
--go
CREATE PROCEDURE LecGradeThesis
@Lecturer_id int, 
@sid int,
@thesis_title varchar(50), 
@Lecturer_grade Decimal(4,2)
as
insert into dbo.GradeAcademicThesis(L_id,sid,Title,lecturer_grade)
values(@Lecturer_id,@sid,@thesis_title,@Lecturer_grade)
go;
--exec LecGradedefense 4,12,'alb',99.5
--go
CREATE PROCEDURE LecGradedefense
@Lecturer_id int,
@sid int,
@defense_location varchar(5), 
@Lecturer_grade Decimal(4,2)
as
insert into dbo.GradeAcademicDefense(L_id,sid,Location,Lecturer_grade)
values(@Lecturer_id,@sid,@defense_location,@Lecturer_grade)
go;
-- exec LecCreatePR 1,2,'2000-12-1','zero'
--go
CREATE PROCEDURE LecCreatePR
@Lecturer_id int,
@sid int,
@date datetime, 
@content varchar(1000)
as
insert into dbo.ProgressReport(UpdatingUser_id ,sid,Date,Content)
values(@Lecturer_id,@sid,@date,@content)
go;
-- exec LecGradePR 4,2,'2000-12-1',45
--go
CREATE PROCEDURE LecGradePR
@Lecturer_id int, 
@sid int,
@date datetime,
@lecturer_grade decimal(4,2)
as
insert into dbo.GradeAcademicPR(L_id,sid,Date,lecturer_garde)
values(@Lecturer_id,@sid,@date,@lecturer_grade)
declare @avg decimal(4,2)
select @avg = Avg(grade)   from dbo.ProgressReport where sid = @sid
update dbo.ProgressReport set ComulativeProgressReportGrade = @avg where sid = @sid
go;
--exec TACreatePR 5,2,'2000-11-1','hero'
--go
CREATE PROCEDURE TACreatePR
@TA_id int,
@sid int,
@date datetime,
@content varchar(1000)
as 
insert into dbo.ProgressReport(UpdatingUser_id,sid,Date,Content)
values(@TA_id,@sid,@date,@content)
go;
--exec TAAddToDo 2,'ok'
--go
CREATE PROCEDURE TAAddToDo
@meeting_id int, 
@to_do_list varchar(200)
as
insert into dbo.MeetingToDoList values(@meeting_id,@to_do_list)
go;

--exec EEGradeThesis 16,15,'meow',67
--go
CREATE PROCEDURE EEGradeThesis
@EE_id int,
@sid int,
@thesis_title varchar(50), 
@EE_grade Decimal(4,2)
as
insert into dbo.GradeAcademicThesis(EE_id,sid,Title,EE_grade)
values(@EE_id,@sid,@thesis_title,@EE_grade)
go;
--exec  EEGradedefense 16,3,'ccc',72
--go
CREATE PROCEDURE  EEGradedefense
@EE_id int,
@sid int, 
@defense_location varchar(5), 
@EE_grade Decimal(4,2)
as
insert into dbo.GradeAcademicDefense(EE_id,sid,Location,EE_grade)
values(@EE_id,@sid,@defense_location,@EE_grade)
go;
--exec viewUsers 'student',13
--go
CREATE PROCEDURE ViewUsers
@User_type varchar(20), 
@User_id int
as
select * from dbo.users
where Role= @User_type and user_id = @User_id
order by Role,user_id
go;
--exec AssignAllStudentsToLocalProject
--go
create procedure AssignAllStudentsToLocalProject
as
declare @count int
SELECT @count =COUNT(sid) 
FROM dbo.Student
declare @sid int ,@code varchar(10),@prefnum int , @min int ,@gpa decimal(3,2),@mingpa decimal(3,2),@countpref int,@countgpa int,@random varchar(10)
set @sid=1;
while(@count!=0)
begin
if exists(select sid from dbo.Student where sid = @sid)
begin
select @prefnum= p.PreferenceNumber ,@code = p.PCode ,@gpa=S.GPA
from dbo.Student S inner join dbo.StudentPreferences P on S.sid =P.sid
where S.sid =@sid
select @min= min(PreferenceNumber) from dbo.StudentPreferences where PCode=@code
select @mingpa  =min(S.GPA) 
from dbo.Student S ,dbo.StudentPreferences P where PCode=@code
select @countpref=count(PreferenceNumber) from dbo.StudentPreferences
where PreferenceNumber =@min
select @countgpa=count(GPA) 
from dbo.Student  where  GPA=@mingpa
if @prefnum =@min and @countpref =1
begin
update dbo.Student set Assigned_Project_code =@code where sid =@sid
set @sid = @sid + 1
set @count = @count - 1 
end
else if @gpa = @mingpa and @countgpa=1
begin
update dbo.Student set Assigned_Project_code =@code where sid =@sid
set @sid = @sid + 1
set @count = @count - 1 
end
else
begin
declare @count2 int
set @count2=0
while(@count2!=1)
begin
SELECT TOP 1 @random = code FROM dbo.Bachelor_Project
ORDER BY NEWID()
if not exists( select Assigned_Project_code from dbo.Student where Assigned_Project_code = @random)
begin
update dbo.Student set Assigned_Project_code =@random where sid =@sid
set @sid = @sid + 1
set @count = @count - 1 
set @count2 = 1
end
end
end
end
else   
begin
set @sid = @sid + 1
end
end
select S.sid, B.* from dbo.Student S inner join dbo.Bachelor_Project B 
on S.Assigned_Project_code =B.code

go;
--exec AssignTAs 9,5,'abc'
--go
CREATE PROCEDURE AssignTAs
@coordinator_id int, 
@TA_id int, 
@proj_code varchar(10)
as 
if exists(select coordinator_id from dbo.Coordinator where coordinator_id=@coordinator_id)
begin
insert into dbo.Academic(Academic_code,TA_id) 
values(@proj_code,@TA_id)
end
else
begin
print 'coordinator doesnt exist'
end
go;
--exec ViewRecommendation 1
--go
CREATE PROCEDURE ViewRecommendation
@lecture_id int
as
select * from dbo.LecturerRecommendEE
where L_id = @lecture_id
order by L_id
go;

--exec AssignEE 9,16,'idk0'
--go
CREATE PROCEDURE AssignEE
@coordinator_id int,
@EE_id int,
@proj_code varchar(10)
as 
if exists(select coordinator_id from dbo.Coordinator where coordinator_id=@coordinator_id)
begin
insert into dbo.Academic(Academic_code,EE_id) 
values(@proj_code,@EE_id)
end
else
begin
print 'coordinator doesnt exist'
end
go;
--exec ScheduleDefense 15,'2030-10-22','12:00','heart'
--go
CREATE PROCEDURE ScheduleDefense
@sid int, 
@date datetime,
@time time, 
@location varchar(5)
as
insert into dbo.Defense(sid,Date,Time,location)
values(@sid,@date,@time,@location)
go;


--exec EmployeeGradeThesis 2,13,'meow',44
--go
CREATE PROCEDURE EmployeeGradeThesis
@Employee_id int, 
@sid int, 
@thesis_title varchar(50), 
@Employee_grade Decimal(4,2)
as
insert into dbo.GradeIndustrialThesis(E_id,sid,Title,Employee_grade)
values(@Employee_id,@sid,@thesis_title,@Employee_grade)
go;
--exec EmployeeGradedefense 1,15,'heart',64
--go
CREATE PROCEDURE EmployeeGradedefense
@Employee_id int,
@sid int, 
@defense_location varchar(5),
@Employee_grade Decimal(4,2)
as
insert into dbo.GradeIndustrialDefense(E_id,sid,Location,Employee_grade)
values(@Employee_id,@sid,@defense_location,@Employee_grade)
go;
--exec EmployeeCreatePR 2,2,'2050-1-2','peace'
--go
CREATE PROCEDURE EmployeeCreatePR
@Employee_id int, 
@sid int,
@date datetime, 
@content varchar(1000)
as
insert into dbo.ProgressReport(UpdatingUser_id,sid,Date,Content)
values(@Employee_id,@sid,@date,@content)
go;


