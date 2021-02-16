
/* Archit Jain homework 5  */

-- Task 1 -- 
SELECT STATECODE FROM EMPLOYER 
UNION 
SELECT LOCATION FROM QUARTER;

/* task 2 */
SELECT employer.companyname , employer.division , statecode ,salaryoffered 
FROM employer INNER JOIN interview 
ON employer.companyname = interview.companyname 
AND employer.division =interview.division;

/* task 3*/
SELECT * from state 
WHERE statecode NOT IN 
(SELECT statecode FROM employer);

/* task 4*/
SELECT DISTINCT companyname, minhrsoffered 
FROM interview ;

/* task 5 */
SELECT * FROM state 
WHERE substring(description, 3,1) 
IN ('A','E','I','O','U');

/*task 6*/
SELECT qtrcode, quarter.location,description FROM quarter, state
WHERE quarter.location = state.statecode;

/*task 7*/
SELECT description , companyname 
FROM state LEFT OUTER JOIN employer 
ON state.statecode = employer.statecode;