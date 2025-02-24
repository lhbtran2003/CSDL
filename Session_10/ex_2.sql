use world;

delimiter //
create PROCEDURE CalculatePopulation (IN p_countryCode char(3), OUT total_population int)
BEGIN
select population into total_population from country
where code = p_countryCode;
end; //
delimiter;

call CalculatePopulation('VNM', @total);

SELECT @total

drop PROCEDURE CalculatePopulation;