use world;

delimiter $$
create PROCEDURE bai1( IN country_code CHAR(3))
   BEGIN
       SELECT `Name`, Population FROM country
       WHERE `Code` = country_code;
    END; $$
delimiter;



call  bai1('VNM')


select * FROM country
