use world;

SELECT * from countrylanguage

delimiter //
create PROCEDURE percentUseLanguage 
   (IN language_IN char(50)) 
     BEGIN 
       select CountryCode, LANGUAGE, percentage
       from countrylanguage
       where percentage > 50.0 and language = LANGUAGE_IN;
     END; //
 DELIMITER;
 
 CALL percentUseLanguage('English');

 drop procedure percentUseLanguage