--This was a project from Khan Academy to use an existing dataset to test queries using aggragate functions, filtering and case functions as well as sorting using group by and order by.
--I chose a dataset of Marvel characters that lists their ID numbers, names, popularity, moral alignment, gender, height in meters, weight in kg, hometown, intelligence, strength, speed, durability, energy projection, and fighting skill.

CREATE TABLE marvels (ID INTEGER PRIMARY KEY,
    name TEXT,
    popularity INTEGER,
    alignment TEXT,
    gender TEXT, 
    height_m NUMERIC,
    weight_kg NUMERIC,
    hometown TEXT,
    intelligence INTEGER,
    strength INTEGER,
    speed INTEGER,
    durability INTEGER,
    energy_Projection INTEGER,
    fighting_Skills INTEGER);
    
INSERT INTO marvels VALUES(1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4); 
INSERT INTO marvels VALUES(2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4); 
INSERT INTO marvels VALUES(3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 1, 7, 3, 7, 5, 4); 
INSERT INTO marvels VALUES(4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7);
INSERT INTO marvels VALUES(5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Asgard", 2, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3);
INSERT INTO marvels VALUES(7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4);
INSERT INTO marvels VALUES(8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3);
INSERT INTO marvels VALUES(10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4);
INSERT INTO marvels VALUES(11, "Jean Grey", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4);
INSERT INTO marvels VALUES(12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7);
INSERT INTO marvels VALUES(13, "Storm", 2, "Good", "Female", 1.80, 66, "Kenya", 2, 2, 3, 2, 5, 4);
INSERT INTO marvels VALUES(14, "Nightcrawler", 6, "Good", "Male", 1.75, 73, "Germany", 3, 2, 7, 2, 1, 3);
INSERT INTO marvels VALUES(15, "Gambit", 7, "Good", "Male", 1.88, 81, "EUA", 2, 2, 2, 2, 2, 4);
INSERT INTO marvels VALUES(16, "Captain America", 9, "Good", "Male", 1.88, 108, "EUA", 3, 3, 2, 3, 1, 6);
INSERT INTO marvels VALUES(17, "Cyclops", 10, "Good", "Male", 1.90, 88, "EUA", 3, 2, 2, 2, 5, 4);
INSERT INTO marvels VALUES(18, "Emma Frost", 12, "Neutral", "Female", 1.78, 65, "EUA", 4, 4, 2, 5, 5, 3);
INSERT INTO marvels VALUES(19, "Kitty Pryde", 13, "Good", "Female", 1.68, 50, "EUA", 4, 2, 2, 3, 1, 5);
INSERT INTO marvels VALUES(20, "Daredevil", 14, "Good", "Male", 1.83, 91, "EUA", 3, 3, 2, 2, 4, 5);
INSERT INTO marvels VALUES(21, "Punisher", 50, "Neutral", "Male", 1.85, 91, "EUA", 3, 3, 2, 2, 1, 6);
INSERT INTO marvels VALUES(22, "Silver Surfer", 33, "Good", "Male", 1.93, 102, "Zenn-La", 3, 7, 7, 6, 7, 2);
INSERT INTO marvels VALUES(23, "Ghost Rider", 86, "Good", "Male", 1.88, 99, "EUA", 2, 4, 3, 5, 4, 2);
INSERT INTO marvels VALUES(24, "Venon", 78, "Neutral", "Male", 1.90, 118, "EUA", 3, 4, 2, 6, 1, 4);
INSERT INTO marvels VALUES(25, "Juggernaut", 76, "Neutral", "Male", 2.87, 862, "EUA", 2, 7, 2, 7, 1, 4);
INSERT INTO marvels VALUES(26, "Professor X", 58, "Good", "Male", 1.83, 86, "EUA", 5, 2, 2, 2, 5, 3);

--This first statement selects all from the table MARVELS.

SELECT * FROM marvels;

--The second statement selects the rounded average height, weight, energy projection, and fighting skills of the characters as well as the highest intelligence and strength, and the lowest speed and durability.

Select round(avg(height_m)) as avg_height,round(avg(weight_kg)) as avg_weight,max (intelligence),
	max (strength),min (speed),min (durability),round(avg(energy_Projection))as avg_energy_Projection,
	round(avg(fighting_Skills))as avg_fighting_Skill 
From marvels;

--The third statement selects the names, genders and energy projection of characters with an energy projection of greater than 3, ordered by gender and energy projection.

Select name, gender, energy_projection from marvels group by name having energy_projection > 3 order by gender, energy_projection;

--The fourth statement creates a ranking of categories for durability starting from "squishy" and ending at "indestructable", and selects the characters names, durability score, and durability ranking and orders them by durability.

Select name, durability,
    Case
        when durability >=7 then "indestructable"
        when durability >=5 then "unbreakable"
        when durability >=3 then "tough"
        else "squishy"
    End as "rating"
From marvels order by durability;

--The fifth statement selects the name, gender, weight and height of each character who weight more than 60 kg and is female or is male who weighs less than 90 kg but is taller than 2 meters, and orders them by gender, weight, and height.

Select name, gender, weight_kg, height_m From marvels 
	Where weight_kg > 60 and gender = "Female" 
	Or (gender = "Male" and weight_kg < 90 and height_m < 2) 
Order by gender, weight_kg, height_m;

--The sixth statement selects the characters who are of good alignment and are not from the USA.

Select name, alignment, hometown from marvels where alignment IN ("Good") and hometown NOT IN ("USA") order by hometown;

--The final statement selects the number of characters with a strength greater than 4 and fighting skills greater than 3 for each gender.

Select gender, count(*) as count from marvels where strength > 4 and fighting_Skills > 3 group by gender;