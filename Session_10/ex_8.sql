USE world;
delimiter //
 create procedure GetCountriesByCityNames  ()
 BEGIN
 select country.`Name` as CountryName, country.population as TotalPopulation, countrylanguage.IsOfficial AS OfficialLanguage
 from countrylanguage
 inner join country
 on CountryCode = `Code`
 where IsOfficial = 'T' and country.`Name` LIKE 'A%' AND Population > 2000000
 ORDER BY `Name`
 LIMIT 10;
 END; //
 delimiter;
 
 
 
CALL GetCountriesByCityNames()

drop PROCEDURE GetCountriesByCityNames