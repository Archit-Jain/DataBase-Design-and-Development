/*Task 1*/
SELECT CONCAT(city,", ",Statecode) AS Location , Count(City) AS Count 
FROM Publisher 
GROUP BY Location 
ORDER BY count, Location Desc;
/*Task 2*/
SELECT title,COUNT(rating) AS "Total Ratings",MIN(rating) as Low,MAX(rating) As High,ROUND(AVG(rating),2) as Average 
FROM book LEFT JOIN bookreview 
ON book.isbn=bookreview.isbn 
GROUP BY title 
ORDER BY Count(rating) desc,Average desc;
/*Task 3*/
select name as "Publisher Name", count(name) "Book Count" 
from publisher,book 
where Publisher.publisherID = book.publisherID 
group by name 
having count(name)>2 
order by count(name) desc, name;
/*Task 4*/
select title,Length(title) as Length , substr(title,instr(title,"Bill")+4) As "After Bill" 
from book 
where title like '%bill%';
/*Task 5*/
select distinct(title) as title 
from ownersbook, book 
where book.isbn = ownersbook.isbn;