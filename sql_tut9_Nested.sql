create database nested;
use nested;

create table students(
	student_id int primary key,
    name varchar(50)
);

create table marks(
	marks_id int primary key,
    student_id int,
    subject varchar(50),
    score int
);

insert into students
(student_id,name)
values
(1, 'Kunal'), 
(2, 'Sneha'), 
(3, 'Ravi');

insert into marks
(marks_id,student_id,subject,score)
values
(101, 1, 'Math', 90),
(102, 1, 'Science', 85),
(103, 2, 'Math', 70),
(104, 2, 'Science', 75),
(105, 3, 'Math', 60),
(106, 3, 'Science', 55);


-- 1. Get names of students who scored more than 80 in any subject.
select name
from students
where student_id in(
	select student_id
    from marks
    where score>80
    );
    
-- 2. Get students whose average score is above the overall average.
select student_id
from marks
group by student_id
having avg(score)>(
	select avg(score) from marks
);

-- 3. Show name and average score using subquery in FROM
select
	s.name,
    m.avg_score
from
	students s
join
	(
		select student_id, avg(score) as avg_score
        from marks
        group by student_id
    ) as m
on
	s.student_id=m.student_id;

-- joining 2 tables

select
	m.marks_id,
    s.name,
    m.subject,
    m.score
from
	marks as m
join
	students as s
on
	m.student_id=s.student_id;

-- 4. Get students who scored the highest in Math.
select
	max(score)
from
	marks
where
	subject="Math";

select student_id
from marks
where subject='Math' and score=(
	select max(score)
    from marks
    where subject='Math'
);

-- 5. Show students who have a lower average than Sneha
select student_id from students where name='Sneha';

-- get her avg score
select avg(score) from marks where student_id=2;

-- Now get other students whose average < Sneha's

SELECT 
    s.student_id,
    s.name,
    AVG(m.score) AS avg_score
FROM 
    students s
JOIN 
    marks m ON s.student_id = m.student_id
GROUP BY 
    s.student_id, s.name
HAVING 
    AVG(m.score) < (
        SELECT AVG(score)
        FROM marks
        WHERE student_id = (
            SELECT student_id
            FROM students
            WHERE name = 'Sneha'
        )
    );
    
-- 6. Display all subjects where Ravi scored above the average of that subject.
SELECT 
    m.subject,
    m.score
FROM 
    marks m
WHERE 
    m.student_id = (
        SELECT student_id FROM students WHERE name = 'Ravi'
    )
    AND m.score > (
        SELECT AVG(score)
        FROM marks
        WHERE subject = m.subject
    );













