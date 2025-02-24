use world;

delimiter //
   create PROCEDURE UpdateCityPopulation (INOUT city_id int, INOUT new_population int)
   BEGIN
      UPDATE city
      SET Population = new_population
      WHERE ID = city_id;
      
      SELECT ID, `Name`, Population
      INTO city_id, new_population, @dummy
      FROM city
      WHERE ID = city_ID;
      
      SELECT ID, `Name`, Population FROM city WHERE ID = city_id;
      
    END; //
delimiter;

SET @city_id = 1;
SET @new_population = 100;

CALL UpdateCityPopulation(@city_id, @new_population);

SELECT @city_id, @new_population; 
