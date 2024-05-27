--run procedure SpecifyThesisDeadline first since it is used when inserting into table thesis
--insertions to each table are ordered correctly so they can be run in one go (after creating the SpecifyThesisDeadline procedure)
-- insertions are made accordingly to be able to test every case in every procedure
--Users
INSERT INTO dbo.users VALUES( 'Malak' , '1234' , 'malak@cato.com' , 'lecturer' , '01025289833');
INSERT INTO dbo.users VALUES('Mariam' , '5867' , 'mariam@cato.com' , 'student' , '01025278933');
INSERT INTO dbo.users VALUES( 'Anas', '5634' , 'anas@cato.com' , 'student' , '01025289633');
INSERT INTO dbo.users  VALUES( 'Farah', 'm3632' , 'farah@cato.com' , 'lecturer' , '01025285733');
INSERT INTO dbo.users  VALUES( 'Mohamed', '2565' , 'mohamed@cato.com' , 'TA' , '010252742833');
INSERT INTO dbo.users VALUES('Tarek', '!ghi12@3' , 'tarek@cato.com' , 'externalexaminer' , '01025284433');
INSERT INTO dbo.users VALUES( 'Khaled', '#ab14@2' , 'khaled@cato.com' , 'coordinator' , '01025289833');
INSERT INTO dbo.users VALUES( 'Yehia', '$5%12a' , 'yehia@cato.com' , 'TA' , '01024359833');
INSERT INTO dbo.users VALUES( 'Omar', 'def@123' , 'omar@cato.com' , 'coordinator' , '01025264833');
INSERT INTO dbo.users VALUES( 'Memo', '#12#abc' , 'memo@cato.com' , 'company' , '01025257833');
INSERT INTO dbo.users VALUES( 'Mark', '@123#ab' , 'mark@cato.com' , 'company' , '01025292133');
INSERT INTO dbo.users VALUES( 'alaa', 'bata20' , 'alaa@cato.com' , 'student' , '01228359833');
INSERT INTO dbo.users VALUES( 'Omara', 'def@123' , 'omara@cato.com' , 'student' , '01029339090');
INSERT INTO dbo.users VALUES( 'Mimo', '#12habc' , 'mimo@cato.com' , 'student' , '01025255555');
INSERT INTO dbo.users VALUES( 'Mao', '@155#ab' , 'mao@cato.com' , 'student' , '01025292993');
INSERT INTO dbo.users VALUES( 'Maomao', '@155#cc' , 'maomao@cato.com' , 'externalexaminer' , '01025295555'); 
-------------------------------------------------------------------------------------
--Lecturer
INSERT INTO lecturer VALUES( 1 , 'Monday');
INSERT INTO lecturer VALUES(4,'Tuesday'); 
----------------------------------------------------------------------------------------
--LecturerFields
INSERT INTO LecturerFields VALUES( 1 , 'CS');
INSERT INTO LecturerFields VALUES( 4,'Engineer');   
-------------------------------------------------------------------------------------
--Faculty
INSERT INTO Faculty VALUES( 'INCS101' , 'Engineer' , 1);
INSERT INTO Faculty VALUES('3INF6','CS' , 4);  
-------------------------------------------------------------------------------------
--Major
INSERT INTO Major VALUES( 'INCS101' , 'abc101' ,  'Civil');
INSERT INTO Major VALUES('3INF6','def102' ,  'Data Science');  
-------------------------------------------------------------------------------------
--Company
INSERT INTO company VALUES(10,'Apple' , 'Meko' , 'meko@cato.com' ,'NYC');
INSERT INTO company VALUES(11,'Banana' , 'joe' , 'joe@cato.com' ,'TaG'); 
-------------------------------------------------------------------------------------
--Employee
INSERT INTO Employee VALUES(10,'bateekh' , '123@abc' , 'bateekh@cato.com' ,'IT' , '01235685299');
INSERT INTO Employee VALUES(11,'3enab' , '123@ab#8c' , '3enab@cato.com' ,'engineer' , '012356852789');    
-------------------------------------------------------------------------------------
--External_Examiner
INSERT INTO External_Examiner VALUES(6,'Monday' );
INSERT INTO External_Examiner VALUES(16,'Sunday' );  
-------------------------------------------------------------------------------------
--Teaching_Assistant
INSERT INTO Teaching_Assistant VALUES(5,'Sunday' );
INSERT INTO Teaching_Assistant VALUES(8,'Thursday' );      
-------------------------------------------------------------------------------------
--Coordinator
INSERT INTO Coordinator VALUES(7);
INSERT INTO Coordinator VALUES(9);   
-------------------------------------------------------------------------------------
--Bachelor_Project 
INSERT INTO Bachelor_Project VALUES('abc','Batates' , 'paper' , 'lol' );
INSERT INTO Bachelor_Project VALUES('def','Catos'  , 'scissors' , 'idk');
INSERT INTO Bachelor_Project VALUES('ghi','Pizza'   , 'rubber' , 'meoww');
INSERT INTO Bachelor_Project VALUES('jkl','M3rafsh'  , 'rock' , 'huh');
INSERT INTO Bachelor_Project VALUES('pasta','sad'  , 'rock' , 'hwhat');
INSERT INTO Bachelor_Project VALUES('sushi','sad'  , 'catto' , 'hwhat');  
-------------------------------------------------------------------------------------
--Student
INSERT INTO Student VALUES(2,'Mariam' ,'Khaled', 'abc101' , '2003-9-25' , 'Meow' , 3 , 1.5 , null , null);
INSERT INTO Student VALUES(3,'Mohamed' ,'Anas' ,'def102' , '2003-1-1' , 'Meow', 3 , 1.4 , 2 , null ); 
INSERT INTO Student VALUES(12,'Mohmoud' ,'Anoosa' ,'abc101'  , '2003-1-1'  , 'Meow', 5 , 2.4 , 1 , null );
INSERT INTO Student VALUES(13,'Moha' ,'Anwar' ,'def102' , '2003-1-1'  , 'Meow', 8 , 3.7 , 6 , null );
INSERT INTO Student VALUES(14,'Moz' ,'Ana' ,'abc101'  , '2003-1-1'  , 'Meow', 1 , 5.4 , 3 , null);
INSERT INTO Student VALUES(15,'moataz' ,'Anoosy' ,'def102' , '2003-1-1'  , 'Meow', 6 , 1.8 , null , null ); 
update dbo.Student set Assigned_Project_code = null -- they get assigned projects usinging procedure AssignAllStudentsToLocalProject
------------------------------------------------------------------------------------------------------
--BachelorSubmittedMaterials
INSERT INTO BachelorSubmittedMaterials VALUES('abc','Batates' );
INSERT INTO BachelorSubmittedMaterials VALUES('def','Catos');      
INSERT INTO BachelorSubmittedMaterials VALUES('ghi','Pizza' );
INSERT INTO BachelorSubmittedMaterials VALUES('jkl','M3rafsh'); 
-------------------------------------------------------------------------------------
--Academic 
INSERT INTO Academic VALUES('jkl',1,5,6);
INSERT INTO Academic VALUES('def',4,8,6);   
-------------------------------------------------------------------------------------
--Industrial
INSERT INTO Industrial VALUES('ghi',10,1,1);
INSERT INTO Industrial VALUES('abc',null,4,null);    
-------------------------------------------------------------------------------------
--Meeting
INSERT INTO Meeting VALUES(1,'8:30' , '10:00' , 2022/12/7 , 'Giu');
INSERT INTO Meeting VALUES(4,'10:15' , '11:45' ,2022/12/8 , 'Guc');
INSERT INTO Meeting VALUES(null,'10:15' , '11:45' , 2022/12/8 , 'seman');  
-------------------------------------------------------------------------------------
--MeetingToDoList 
INSERT INTO MeetingToDoList VALUES(2,'LectureOne');
INSERT INTO MeetingToDoList VALUES(1,'LectureTwo');
INSERT INTO MeetingToDoList VALUES(3,'meow');    
--------------------------------------------------------------------------------------
--MeetingAttendents 
INSERT INTO MeetingAttendents VALUES(2,3);          
INSERT INTO MeetingAttendents VALUES(1,2);   
--------------------------------------------------------------------------------------
--Thesis
--INSERT INTO Thesis VALUES(2,'SQL' , 12/12/2022 , 'Find name of students in cs major',86);
--INSERT INTO Thesis VALUES(3,'Cs' , 15/12/2022 , 'Print a triangle',null);
--INSERT INTO Thesis VALUES(15,'Cs2' , 15/12/2022 , null,50);
exec SpecifyThesisDeadline '2/12/2020'           
update Thesis set PDF_doc = 'Print a triangle' where sid = 2 or sid = 3
update Thesis set total_Grade = 86 where sid = 2 
-------------------------------------------------------------------------------------
--Defense
INSERT INTO Defense VALUES(2,'ttt' , 'eng' , '9:30' , '2022-12-25' , 80.5);
INSERT INTO Defense VALUES(3,'ccc' ,'bip' ,'11:00',   '2022-11-24' , 75.4);
INSERT INTO Defense VALUES(12,'alb' ,'bipbop' ,'12:00','2022-10-24' , null);  
INSERT INTO Defense VALUES(13,'meow' ,null ,'1:35',  '2022-12-14' , 75.4); 
-------------------------------------------------------------------------------------
--ProgressReport
INSERT INTO ProgressReport VALUES(2, 'eng' , 28 , '2022-12-25' ,5 ,80);
INSERT INTO ProgressReport VALUES(3,'bip' ,55,   '2022-12-24' ,1 ,70);    
INSERT INTO ProgressReport VALUES(13,null ,null,   '2023-12-24' ,1 ,null);
INSERT INTO ProgressReport VALUES(13,null ,20,   '2000-12-01',2 ,null);
INSERT INTO ProgressReport VALUES(12,null ,null,  '2020-12-24' ,1 ,null);
INSERT INTO ProgressReport VALUES(13,'mew' ,null,  '1999-10-10',4 ,null); 
-------------------------------------------------------------------------------------
--GradeIndustrialPR
INSERT INTO GradeIndustrialPR VALUES(2,'2022-12-25' ,10 ,90 ,90.5);   
INSERT INTO GradeIndustrialPR VALUES(3,'2022-12-24' ,11 ,0 , null);  
-------------------------------------------------------------------------------------
--GradeAcademicPR
INSERT INTO GradeAcademicPR VALUES(12,'2020-12-24' ,4 ,90 );
INSERT INTO GradeAcademicPR VALUES(13,'2023-12-24' ,1 ,80 ); 
-------------------------------------------------------------------------------------
--GradeAcademicThesis
INSERT INTO GradeAcademicThesis VALUES(1,6 ,12 ,'meow',75.5 ,76);
INSERT INTO GradeAcademicThesis VALUES(4,6 ,13 , 'meow',65.5 , 66); 
-------------------------------------------------------------------------------------
--GradeIndustrialThesis
INSERT INTO GradeIndustrialThesis VALUES(10,1 ,2 ,'meow',75.5 ,76);
INSERT INTO GradeIndustrialThesis VALUES(11,2,3 , 'meow',65.5 , 66);   delete from Thesis
-------------------------------------------------------------------------------------
--GradeAcademicDefense                         
INSERT INTO GradeAcademicDefense VALUES(1,6 ,13 , 'meow',65.5 , 66);  
---------------------------------------------------------------------------------------
--GradeIndustrialDefense
INSERT INTO GradeIndustrialDefense VALUES(10,1 ,2 ,'ttt',85.5 ,86);  
INSERT INTO GradeIndustrialDefense VALUES(11,2 ,3 , 'ccc',95.5 , 96); 
-------------------------------------------------------------------------------------
--LecturerRecommendEE 
INSERT INTO LecturerRecommendEE VALUES(1,6 ,'jkl');  
-------------------------------------------------------------------------------------
--StudentPreferences 
INSERT INTO StudentPreferences VALUES(2,'ghi' , 1);
INSERT INTO StudentPreferences VALUES(3,'abc' , 101);
INSERT INTO StudentPreferences VALUES(13,'jkl' , 105);
INSERT INTO StudentPreferences VALUES(12,'ghi' , 100);
INSERT INTO StudentPreferences VALUES(14,'abc' , 101);  
INSERT INTO StudentPreferences VALUES(15,'abc' , 205);
-------------------------------------------------------------------------------------
--MajorHasBachelorProject 
INSERT INTO MajorHasBachelorProject VALUES('abc101' , 'def');
INSERT INTO MajorHasBachelorProject VALUES('def102', 'abc');
INSERT INTO MajorHasBachelorProject VALUES('abc101' , 'jkl');
INSERT INTO MajorHasBachelorProject VALUES('def102', 'ghi'); 
--------------------------------------------------------------------------------------
