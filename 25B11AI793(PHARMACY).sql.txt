-- database creation
create database Pharmacy;
use Pharmacy;
-- creating table Tablets
create table Tablets(
tablet_id int primary key auto_increment,
tablet_name varchar(50) not null,
tablet_weight float,
for_disease varchar(30),
symptoms varchar(100)); 

-- tablet_id starts from 101
alter table Tablets auto_increment=101;

-- inserting values into the table
insert into Tablets(tablet_name,tablet_weight,for_disease,symptoms)
values("Dolo 650",1.2,"fever","dullness and body heat"),
("Crocin 650",1.2,"fever","high temperature and body pain"),
("Paracetamol 500",0.5,"Fever","Fever and headache"),
("Azithromycin 500",0.5,"Bacterial infection","Sore throat and fever"),
("Amoxicillin 500",0.5,"Bacterial infection","Ear infection ans swelling"),
("Cetirizine 10",0.01,"Allergy","Sneezing and itching"),
("Pantoprazole 40",0.04,"Acidity","Heartburn and acid reflux"),
("Metformin 500",0.5,"Diabetes","High blood sugar"),
("Amlodipine 5",0.005,"High blood pressure","High blood pressure"),
("Atorvastatin 20",0.02,"High cholestrol","High cholestrol"),
("Ibuprofen 400",0.4,"Pain","Joint pain and inflammation");

-- deleting row 101
delete from Tablets
where tablet_id=101;

-- changed column name from for_disease to indication
alter table Tablets rename column for_disease to indacation;

-- changed column name from symptom to symptom_occurs
alter table Tablets rename column symptoms to symptom_occurs;

-- updating the detailks of the row
update Tablets
set symptom_occurs="high temperature and body pain"
where tablet_id=102;

-- displays all the tablet_names and tablet_id's which contains symptom ocuurs="high temperature and body pain"
select tablet_id,tablet_name  from Tablets
where symptom_occurs = "high temperature and body pain";  -- or symptom_occurs like "%body pain" (gives all tablets which contains the word body pain)

-- added  a new column price
alter table Tablets add column price int;

-- updated price of tablet_is=102 to 2rs
update Tablets
set price=2
where tablet_id=102;

-- updated the price of all tablets price to 2Rs
update Tablets set price=2 where tablet_id > 0;

-- removed the column price
alter table Tablets drop column price;

-- removing all the rows and remains only the structure of the table
TRUNCATE TABLE Tablets;

-- displays full table
select * from Tablets;


