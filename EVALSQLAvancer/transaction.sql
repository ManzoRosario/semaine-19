



--1)creation du champs retraité 
INSERT into posts (pos_libelle) 
VALUES ('retraité')

--2)Madame Hannah passe retraité

update employees set emp_pos_id = (select pos_id FROM posts WHERE pos_libelle='retraité') 
WHERE emp_lastname='HANNAH' 
AND emp_firstname='Amity';

--3)Ecrire les requêtes correspondant à ces opérations
--Trouver les employers de Arras:

SELECT * FROM `employees` WHERE emp_city = 'Arras'



--5) passer pepinieriste a manager
UPDATE employees
set emp_pos_id = '2'
where emp_id = 7

--6) modifier de + 5 % le salaire de AMAR Yann le nouveau manager:

UPDATE employees 
set emp_salary = emp_salary * 1.05
where emp_id = 7

--7) anciens collègues pépiniéristes passent sous sa direction.

UPDATE employees 
set emp_superior_id = 7
WHERE emp_pos_id = 14

--8) écrire la transaction

START transaction;
INSERT INTO posts (pos_libelle) VALUES ('retraité');
update employees set emp_pos_id = (select pos_id FROM posts WHERE pos_libelle='retraité') 
WHERE emp_lastname='HANNAH' 
AND emp_firstname='Amity';
SELECT * FROM `employees` WHERE emp_city = 'Arras';
UPDATE employees
set emp_pos_id = '2'
where emp_id = 7;
UPDATE employees 
set emp_salary = emp_salary * 1.05
where emp_id = 7;
UPDATE employees 
set emp_superior_id = 7
WHERE emp_pos_id = 14;

commit