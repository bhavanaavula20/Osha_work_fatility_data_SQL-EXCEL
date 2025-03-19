/* 
 * OSHA Work Related Fatality Records
*/

create database project;
use project;

/*Retrive all data*/

select * from project.osha_fatalities;

/*Limit the results to the first 10 entries*/

SELECT *FROM  project.osha_fatalities
ORDER BY incident_date DESC
LIMIT 10;

/*Check for duplicate entries*/


SELECT incident_date,city,state,
count(*)
FROM project.osha_fatalities
GROUP BY incident_date,city,state
HAVING count(*) > 1
limit 7;
    
 /*What is the number of reported incidents*/   
    
    
    SELECT count(*) AS n_fatalities FROM project.osha_fatalities;
  
  
/*What is the number of fatalities that received a state*/
  
  
SELECT state,
count(*)
FROM project.osha_fatalities
GROUP BY state
limit 5;
    
    
/*What is the number of fatalities involving welding*/
    
    
SELECT state,
count(*) AS welding_fatalities
FROM project.osha_fatalities
WHERE description LIKE '%weld%'
group by state
limit 8;   
    

/*Select the last 5 from the previous query*/


    SELECT*
FROM project.osha_fatalities
WHERE description LIKE '%weld%'
ORDER BY incident_date DESC
LIMIT 5;



/*Select the top 5 states with the most fatal incidents.*/

SELECT state,
count(*) AS incidents
FROM project.osha_fatalities
GROUP BY state
ORDER BY incidents DESC
LIMIT 5;


/*What are the top 5 states that had the most workplace fatalities from stabbings*/


SELECT state,
count(*) AS stabbing_deaths
FROM project.osha_fatalities
WHERE description LIKE '%stabbed%'
GROUP BY state
ORDER BY stabbing_deaths DESC;
    

/*What are the top 10 states that had the most workplace fatalities from shootings*/

    
SELECT state,
count(*) AS shooting_deaths
FROM project.osha_fatalities
WHERE description LIKE '%shot%'
GROUP BY state
ORDER BY shooting_deaths DESC
LIMIT 10;