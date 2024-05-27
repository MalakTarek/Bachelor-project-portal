--Creations of tables are ordered correctly so they can be run in one go
create table users (
user_id int primary key identity ,
Username varchar(20),
Password varchar(10),
Email varchar (50),
Role varchar(20), 
Unique(Email),
phone_Number varchar(20),
);

create table lecturer(
lecturer_id int primary key,
schedule varchar(50), 
FOREIGN KEY(lecturer_id) references users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table LecturerFields(
lecturer_id int ,
field varchar(25), 
primary key (lecturer_id , field),
FOREIGN KEY(lecturer_id) references lecturer(lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Faculty(
Faculty_code varchar(10) ,
name VARCHAR(20), 
primary key (Faculty_code),
Dean int, 
FOREIGN KEY (Dean)  REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Major(
Faculty_code varchar(10),
major_code varchar(10)
PRIMARY KEY (major_code),
major_name VARCHAR(20),
FOREIGN KEY (Faculty_code) REFERENCES Faculty(Faculty_code) ON DELETE CASCADE ON UPDATE CASCADE
);

create table company(
company_id int primary key,
name varchar (20),
Representative_name varchar(20),
Representative_Email varchar(50),
location varchar(5),
FOREIGN KEY(company_id) references users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

Create Table Employee (
Staff_id int identity,
Company_id int,
Username varchar(20),
Password varchar(10), 
Email varchar (50),
field varchar(25),
Phone varchar(20),
unique(Email),
primary key( Staff_id,Company_id ),
FOREIGN KEY(Company_id) references company(company_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE External_Examiner
(
EE_id int PRIMARY KEY,
FOREIGN KEY (EE_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
schedule VARCHAR(50),
);

CREATE TABLE Teaching_Assistant(
TA_id int PRIMARY KEY,
FOREIGN KEY (TA_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
schedule VARCHAR(50)
);

CREATE TABLE Coordinator(
coordinator_id int PRIMARY KEY ,
FOREIGN KEY (coordinator_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table Bachelor_Project(
code varchar(10),
primary key(code),
Name varchar(20), 
Submitted_Materials varchar(25),
Description varchar(200)
);

CREATE Table Student(
sid int primary key ,
first_name VARCHAR(20),
last_name VARCHAR(20),
Major_code varchar(10) references Major(major_code) on delete cascade on update cascade,  
Date_Of_Birth datetime,  
Address varchar(100), 
Semester int, 
GPA DECIMAL(3,2),
TotalBachelorGrade Decimal(4,2),
Assigned_Project_code varchar(10),
Age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(Date_Of_Birth)), 
FOREIGN KEY(sid) REFERENCES Users(user_id), --ON DELETE cascade ON UPDATE cascade, 
FOREIGN KEY(Assigned_Project_code) REFERENCES Bachelor_Project(code) ON DELETE set null ON UPDATE CASCADE
);



CREATE TABLE BachelorSubmittedMaterials( 
code varchar(10),
primary key(code), 
Material varchar(100), 
FOREIGN KEY(code) REFERENCES Bachelor_Project(code) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Academic (
Academic_code varchar(10) ,
L_id int,
TA_id int,
EE_id int,
primary key(Academic_code),
FOREIGN KEY(Academic_code) references Bachelor_Project(code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(L_id) references lecturer(lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(TA_id) references Teaching_Assistant(TA_id),-- ON DELETE cascade ON UPDATE cascade,
FOREIGN KEY(EE_id) references External_Examiner(EE_id) --ON DELETE cascade ON UPDATE cascade
);

create table Industrial(
Industrial_code varchar(10)
primary key(Industrial_code),
C_id int,
L_id int,
E_id int,
FOREIGN KEY(Industrial_code) references Bachelor_Project(code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(C_id) references Company(company_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(L_id) references Lecturer(lecturer_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY(E_id ,C_id) references Employee(Staff_id , Company_id)-- ON DELETE CASCADE ON UPDATE CASCADE --- MEOW?????
);

CREATE TABLE Meeting(
Meeting_ID int identity primary key,
L_id int references Lecturer(Lecturer_id) on delete cascade on update cascade,
STime time,
ETime time,
Duration as datediff(minute,STime,ETime),
Date datetime ,
Meeting_Point varchar(5)
);

CREATE Table MeetingToDoList(
Meeting_ID int,
ToDoList varchar(200),
PRIMARY KEY(Meeting_ID,ToDoList ),
FOREIGN KEY(Meeting_ID) REFERENCES  Meeting(Meeting_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table MeetingAttendents(
Meeting_ID int,
Attendant_id int,
PRIMARY KEY(Meeting_ID ,Attendant_id),
FOREIGN KEY(Meeting_ID) REFERENCES  Meeting(Meeting_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(Attendant_id) REFERENCES Users(user_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Thesis(
sid INT,
Title varchar(50) default 'meow',
Deadline datetime,
PDF_doc varchar(1000),
total_Grade decimal(4,2),
PRIMARY KEY(sid, Title),
FOREIGN KEY(sid) REFERENCES Student(sid) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Defense(
sid int , 
location varchar(5),
Content varchar(1000),
Time time,
Date Datetime,
total_Grade decimal(4,2),
primary key (sid , location),
FOREIGN KEY(sid) references Student(sid) ON DELETE CASCADE ON UPDATE CASCADE
);

create table ProgressReport(
sid int , 
Content varchar(1000),
grade decimal(4,2),
Date datetime,
UpdatingUser_id int ,
ComulativeProgressReportGrade decimal(4,2),
primary key(sid , Date),
FOREIGN KEY(sid) references Student(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(UpdatingUser_id) references Users(user_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

create table GradeIndustrialPR(
sid int ,
Date datetime, 
C_id int ,
Company_grade decimal(4,2),
Lecturer_grade decimal (4,2),
primary key(sid,date),
FOREIGN KEY(sid) references Student(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(sid,Date) references ProgressReport(sid ,Date),-- ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(C_id) references Company(company_id) --ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE  GradeAcademicPR(
sid int,
Date datetime,
L_id int,
lecturer_garde decimal(4,2),
PRIMARY KEY(sid , Date),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sid ,Date) REFERENCES ProgressReport(sid,Date) --ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE GradeAcademicThesis(
L_id INT,
EE_id INT,
sid INT,
Title VARCHAR(50),
EE_grade decimal(4,2),
lecturer_grade decimal(4,2),
PRIMARY KEY(sid , Title),
FOREIGN KEY (L_id) REFERENCES Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EE_id) REFERENCES External_Examiner(EE_id) ,--ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sid,Title) REFERENCES Thesis(sid ,Title)-- ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE  GradeIndustrialThesis(
C_id INT,
E_id INT,
sid INT,
Title VARCHAR(50),
Company_grade decimal(4,2),
Employee_grade decimal(4,2),
PRIMARY KEY (sid , Title),
FOREIGN KEY (C_id) REFERENCES Company(Company_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (E_id ,C_id) REFERENCES Employee(Staff_id , Company_id),-- ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (sid,Title) REFERENCES Thesis(sid ,Title)-- ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE Table GradeAcademicDefense(
L_id int,
EE_id int,
sid int,
Location varchar(5),
EE_grade decimal(4,2),
Lecturer_grade decimal(4,2),
PRIMARY KEY(sid, Location),
FOREIGN KEY(L_id) REFERENCES  Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(EE_id) REFERENCES External_Examiner(EE_id),-- ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(sid,location) REFERENCES Defense(sid,location)-- ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table GradeIndustrialDefense(
C_id int,
E_id int,
sid int,
Location varchar(5),
PRIMARY KEY(sid, Location),
Company_grade decimal(4,2),
Employee_grade decimal(4,2),
FOREIGN KEY(C_id) REFERENCES  Company(Company_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(E_id,C_id) REFERENCES Employee(Staff_id,Company_id), --ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(sid,Location) REFERENCES Defense(sid,Location)-- ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table LecturerRecommendEE(
L_id int,
EE_id int,
PCode varchar(10),
PRIMARY KEY(EE_id, PCode),
FOREIGN KEY(L_id) REFERENCES   Lecturer(Lecturer_id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(EE_id) REFERENCES  External_Examiner(EE_id), --ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(PCode) REFERENCES  Academic(Academic_code)-- ON DELETE CASCADE ON UPDATE CASCADE
); 

CREATE Table StudentPreferences(
sid int,
PCode varchar(10),
PreferenceNumber int, 
PRIMARY KEY(sid, PCode),
FOREIGN KEY(sid) REFERENCES Student(sid) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(PCode) REFERENCES Bachelor_Project(Code) --ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE Table MajorHasBachelorProject(
Major_code varchar(10),
Project_code varchar(10),
PRIMARY KEY(Major_code, Project_code),
FOREIGN KEY(Major_code) REFERENCES Major(Major_code) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(Project_code) REFERENCES Bachelor_Project(Code) ON DELETE CASCADE ON UPDATE CASCADE
);
