--This was a project from Khan Academy to build a data set from scratch and display intermediate join skills.
--I chose to create a dataset based off of the characters from a tv show including their names, powers, seasons they were introduced, parental status, child status, and character ID number.

CREATE TABLE characters
    (id INTEGER PRIMARY KEY,
    name TEXT,
    stand TEXT);
    
INSERT INTO characters (name, stand) VALUES ("Geroge Joestar I", null),("Jonathan Joestar", "Hamon/HP"), ("DIO Brando","The World"), ("George Joestar II",NULL),("Lisa Lisa",NULL),("Joseph Joestar", "Hermit Purple"), ("Holly Kujo", "Vines"), ("Jotaro Kujo","Star Platinum"), ("Tomoko Higashikata",null),("Josuke Higashikata","Crazy Diamond"),("Giorno Giovana","Gold Experience"), ("Jolyne Cujoh","Stone Free"), ("George Joestar 2",null), ("Johnny Joestar","Tusk"), ("Holly Kira",null),("Kira Yoshikage","Killer Queen"), ("Josefumi Kujo", "Soft and Wet"), ("Gappy Higashikata","Soft & Wet");

--This first statement selects the character ID numbers and names from the CHARACTERS table.

SELECT id, name FROM characters;

CREATE TABLE subtitles
    (id INTEGER PRIMARY KEY,
    part_number integer,
    part_name TEXT);
    
INSERT INTO subtitles (part_number, part_name) VALUES (1,"Phantom Blood"),(2,"Battle Tendency"),(3,"Stardust Crusaders"),(4,"Diamond is Unbreakable"), (5,"Vento Aureo"),(6,"Stone Ocean"),(7,"Steel Ball Run"),(8,"Jojolion");

--The second statement selects the season number and season subtitles.

Select
        subtitles.part_number as "Part Number",
        subtitles.part_name as "Part Name"  from subtitles         
group by subtitles.part_number;

CREATE TABLE Origin
    (id INTEGER PRIMARY KEY,
    character_id integer,
    Part integer);
    
INSERT INTO origin (character_id, part) VALUES (1, 1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,4),(10,4),(11,5),(12,6),(13,7),(14,7),(15,8),(16,8),(17,8),(18,8);

--The third statement selects the names of each character and the season number they were introduced.

SELECT origin.part, characters.name FROM origin join characters on origin.character_id = characters.id;

Create table parents
    (id integer primary key,
    parent integer,
    child integer);

Insert into parents (parent, child) values (1,2),(1,3),(2,11),(3,11),(4,6),(5,6),(6,7),(6,10),(7,8),(8,12),(9,10),(13,14),(15,16),(15,18),(16,18),(17,18);

--The fourth statement selects the names of all characters who are parents, the names of their children, and the subtitles of the seasons the parents and the children were introduced.

Select  s.part_name as "Parent Part", a.name as "Parent",
        z.part_name as "Child Part", b.name as "Child" from parents
        
    join characters a 
        on parents.parent = a.id
    join characters b
        on parents.child = b.id
    join origin o
        on a.id = o.character_id
    join origin i
        on b.id = i.character_id
    join subtitles s
        on o.Part = s.part_number
    join subtitles z
        on i.Part = z.part_number;

--The final statement selects the subtitles of each season, the number of characters in each season and the number of characters with powers in each season.
        
Select subtitles.part_number as "Part Number", 
        subtitles.part_name as "Part Name", 
        count(characters.name) as "Number of Characters",
        count(characters.stand) as "Number of Stands"
        From characters
            join origin on characters.id = origin.character_id
            join subtitles on origin.Part = subtitles.part_number
            group by Origin.Part;