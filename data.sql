CREATE TABLE user_submissions (
    id SERIAL PRIMARY KEY,
    user_id BIGINT,
    question_id INT,
    points INT,
    submitted_at TIMESTAMP WITH TIME ZONE,
    username VARCHAR(50)
);

SELECT * FROM user_submissions;


-- Q.1 List all distinct users and their stats (return user_name, total_submissions, points earned)

select 
username,
count(id) as total_submissions,
sum(points) as point_earned
from user_submissions
group by 1;


-- Q.2 Calculate the daily average points for each user.

SELECT * FROM user_submissions;

select
username,
to_char(submitted_at, 'DD-MM') as day,
avg(points)
from user_submissions
group by 1, 2;

-- Q.3 Find the top 3 users with the most positive submissions for each day.

with daily_sub 
SELECT * FROM user_submissions;

with daily_transaction as
(select
username,
to_char(submitted_at, 'DD-MM') as day,
sum (case
when points >0 then 1 
else 0
end) as correct_submissions
from user_submissions
group by 1, 2),

user_rank 
as
(select 
day,
username,
correct_submissions,
dense_rank() over(partition by day order by correct_submissions desc) as rank
from daily_transaction)

select
day,
username,
correct_submissions
from user_rank
where rank<=3;




-- Q.4 Find the top 5 users with the highest number of incorrect submissions.

select
username,
sum (case
when points < 0 then 1 
else 0
end) as incorrect_submissions
from user_submissions
group by 1
order by incorrect_submissions desc 
limit 5;


--

SELECT 
	username,
	SUM(CASE 
		WHEN points < 0 THEN 1 ELSE 0
	END) as incorrect_submissions,
	SUM(CASE 
			WHEN points > 0 THEN 1 ELSE 0
		END) as correct_submissions,
	SUM(CASE 
		WHEN points < 0 THEN points ELSE 0
	END) as incorrect_submissions_points,
	SUM(CASE 
			WHEN points > 0 THEN points ELSE 0
		END) as correct_submissions_points_earned,
	SUM(points) as points_earned
FROM user_submissions
GROUP BY 1
ORDER BY incorrect_submissions DESC



-- Q.5 Find the top 10 performers for each week.

SELECT * FROM user_submissions;

select *
from
(select 
extract(week from submitted_at ) as week_no,
username,
sum(points) as total_points_earned,
dense_rank() over(partition by extract(week from submitted_at ) order by sum(points) desc) as rank
from user_submissions
group by 1,2
order by week_no, total_points_earned desc)
where 
rank <=10














