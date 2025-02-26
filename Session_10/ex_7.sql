use world;

delimiter //
 create procedure GetEnglishSpeakingCountriesWithCities (IN language_IN char(30))
 BEGIN
 select country.`Name` as country_name, country.population as totalPopulation
 from countrylanguage
 inner join country
 on CountryCode = `Code`
 where `Language` = language_IN AND IsOfficial = 'T' 
 ORDER BY totalPopulation DESC
 LIMIT 10;
 END; //
 delimiter;
 
 call GetEnglishSpeakingCountriesWithCities('English')
 
 drop PROCEDURE GetEnglishSpeakingCountriesWithCities