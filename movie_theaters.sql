#create a workbench database to store data 
CREATE DATABASE movie_theaters; 
USE movie_theaters; 


#create a table to store the value import it from the sample excel sheet 
CREATE TABLE ticket_data(
Ticket_ID INT PRIMARY KEY, 
Movie_Name VARCHAR(100), 
Genre VARCHAR(100), 
Screen VARCHAR(20), 
Region VARCHAR(50), 
Show_Date DATE, 
Show_Time TIME, 
Seats_Sold INT, 
Ticket_Price FLOAT, 
Revenue FLOAT
);

#check if all the values from the excel sheet is uploaded or not
SELECT * FROM movie_theaters.movie_ticket_data_sample; 

#total revenue by genre 
SELECT Genre, SUM(Revenue) AS Total_Revenue 
FROM movie_theaters.movie_ticket_data_sample
GROUP BY Genre
ORDER BY Genre; 

#monthly revenue 
SELECT MONTH(Show_Date) AS Month, SUM(Revenue) AS Monthly_Revenue 
FROM movie_theaters.movie_ticket_data_sample 
GROUP BY Month
ORDER BY Month; 

#most profitable movie 
SELECT Movie_Name, SUM(Revenue) AS Total_Revenue 
FROM movie_theaters.movie_ticket_data_sample 
GROUP BY Movie_Name 
ORDER BY Total_Revenue DESC; 

#peak time analysis 
SELECT Show_Time, SUM(Seats_Sold) AS Total_Audience
FROM movie_theaters.movie_ticket_data_sample 
GROUP BY Show_Time 
ORDER BY Total_Audience DESC; 
