--This was a Project on Kahn Academy to create your own dataset for a store and display basic querying skills using aggregate functions.
--I chose to make my dataset for a store that sells miniature figures of the creatures from Dungeons and Dragons. 
--The values in the table are the product ID, the product name, the creature's size catagory, the price of the product, and the material the miniature is made of.

CREATE TABLE minis (id INTEGER PRIMARY KEY, item TEXT, size TEXT, price REAL, material TEXT);

INSERT INTO minis (item, size, price, material) VALUES ("Goblin", "Small", 3, "Plastic"),
("Ogre", "Large", 7, "Plastic"),
("Stone Giant","Huge",20,"Quartz"),
("Commoner","Medium",5,"Plastic"),
("Ancient Gold Dragon","Gargantuan",40,"Metal"),
("Elf","Medium",5,"Plastic"),
("Kobold","Small",3,"Plastic"), 
("Beholder","Large",10,"Wood"), 
("Treant","Large",10,"Wood"), 
("Dwarf","Medium",4,"Plastic"), 
("Purple Wyrm","Gargantuan",25,"Plastic"), 
("Mind Flayer","Medium",6,"Plastic"), 
("Plasmoid","Small",6,"Puddy"), 
("Lich","Large",10,"Wood"), 
("Goliath","Medium",8,"Quartz"),
("Intellect Devourer","Tiny",2,"Wood");

select * from minis;

select price, item, size, material from minis order by price;

SELECT round(AVG(price),2) as 'Average Price', material 'Material' FROM minis group by material order by AVG(price);

SELECT round(AVG(price),2) as 'Average Price', size 'Size' FROM minis group by size order by AVG(price);

select count(*) as 'Number of Minis', size 'Size' from minis group by size order by count(*) desc;

select count(*) as 'Number of Minis', material 'Material' from minis group by material order by count(*) desc;