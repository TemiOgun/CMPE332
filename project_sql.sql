create table `theatre_complex`(
	`name` VARCHAR(50) NOT NULL,
	`num_theatres` IN,
	
	PRIMARY KEY(`name`));
	
create table `theatre`(
	`num` INT NOT NULL,
	`max_seats` INT,
	`screen_size` VARCHAR(6),
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`num`, `name`),
	FOREIGN KEY(`name`) REFERENCES `theatre_complex`(`name`))

create table `movie`(
	`title` VARCHAR(50) NOT NULL,
	`director` VARCHAR(50) NOT NULL,
	`runtime` INT,
	`rating`, VARCHAR(10),
	`plot` TEXT,
	`production_company` VARCHAR(50),
	`start_date` DATE,
	`end_date` DATE,
	`supplier` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`title`,`director`),
	FOREIGN KEY(`supplier`) REFERENCES `supplier`(`name`))

create table `actors`(
	`name` VARCHAR(50) NOT NULL,
	`title` VARCHAR(50) NOT NULL,
	`director` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`name`),
	FOREIGN KEY(`title`) REFERENCES `movie`(`title`),
	FOREIGN KEY(`director`) REFERENCES `movie`(`director`))
	
create table `supplier`(
	`name` VARCHAR(50) NOT NULL,
	`city` VARCHAR(50),
	`street` VARCHAR(50),
	`postal_code` CHAR(6),
	`contact` INT NOT NULL,
	PRIMARY KEY(`name`),
	FOREIGN KEY(`name`) REFERENCES `movie`(`supplier`)
	FOREIGN KEY(`contact`) REFERENCES `person`(`account_num`))

create table `person`(
	`account_num` INT NOT NULL,
	`fname` VARCHAR(50),
	`lname` VARCHAR(50),
	`city` VARCHAR(50),
	`street` VARCHAR(50),
	`postal_code` CHAR(6),
	`email` VARCHAR(50),
	`admin_flag` BOOLEAN,
	PRIMARY KEY(`account_num`))

create table `customer`(
	`cc_num` CHAR(16),
	`cc_exp` CHAR(4),
	`account_num` INT NOT NULL,
	FOREIGN KEY (`account_num`) REFERENCES `person`(`account_num`))

create table `reservation`(
	`start_time` DATETIME NOT NULL,
	`theatre_complex` VARCHAR(50) NOT NULL,
	`theatre_num` INT,
	`title` VARCHAR(50) NOT NULL,
	`director` VARCHAR(50) NOT NULL,
	`account_num` INT NOT NULL,
	PRIMARY KEY(`start_time`,`title`, `theatre_complex`, `theatre_num`, `director`, `account_num`),
	FOREIGN KEY(`start_time`) REFERENCES `movie`(`start_time`),
	FOREIGN KEY(`title`) REFERENCES `movie`(`title`),
	FOREIGN KEY(`director`) REFERENCES `movie`(`director`),
	FOREIGN KEY(`account_num`) REFERENCES `movie`(`account_num`),
	FOREIGN KEY(`theatre_num`) REFERENCES `theatre`(`num`),
	FOREIGN KEY(`theatre_complex`) REFERENCES `theatre_complex`(`name`))
	
create table `showing`(
	`start_time` DATETIME NOT NULL,
	`end_time` DATETIME NOT NULL,
	`title` VARCHAR(50) NOT NULL,
	`director` VARCHAR(50) NOT NULL,
	`theatre_complex` VARCHAR(50) NOT NULL,
	`theatre_num` INT,
	PRIMARY KEY(`start_time`,`title`, `theatre_complex`, `theatre_num`, `director`),
	FOREIGN KEY(`title`) REFERENCES `movie`(`title`),
	FOREIGN KEY(`director`) REFERENCES `movie`(`director`),
	FOREIGN KEY(`theatre_complex`) REFERENCES `theatre_complex`(`name`),
	FOREIGN KEY(`theatre_num`) REFERENCES `theatre`(`num`))
	
create table `contacts`(
	`account_num` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`account_num`, `name`)
	FOREIGN KEY(`account_num`) REFERENCES `person`(`account_num`),
	FOREIGN KEY(`name`) REFERENCES `supplier`(`name`))
	
create table `review`(
	`account_num` INT NOT NULL,
	`title` VARCHAR(50) NOT NULL,
	`director` VARCHAR(50) NOT NULL,
	`review_text` VARCHAR(2000),
	PRIMARY KEY(`account_num`, `title`, `director`),
	FOREIGN KEY(`account_num`) REFERENCES `customer`(`account_num`),
	FOREIGN KEY(`title`) REFERENCES `movie`(`title`),
	FOREIGN KEY(`director`) REFERENCES `movie`(`director`))
	


		
insert into theatre_complex values
("Cineplex", 4),
("Starlight Theatres", 3)
;

insert into theatre values
(1,100, "Large", "Cineplex"),
(2,100, "Large", "Cineplex"),
(3,75, "Medium", "Cineplex"),
(4,50, "Small", "Cineplex"),
(1,,100, "Large", "Starlight Theatres"),
(2,75,"Medium","Starlight Theatres"),
(3,50,"Small","Starlight Theatres")
;

insert into movie values
("Avengers: Infinity War", "Joss Whedon", 150, "The Avengers fight Thanos", "Marvel Studios", "PG", 2018-05-01, 2018-10-01, "Marvel Supply CO."), 
("Black Panther", "Ryan Coogler", 120, "T'Challa returns home", "Marvel Studios", "PG", 2018-02-01, 2018-07-01, "Marvel Supply CO."),
("Tomb Raider", "Roar Uthaug", 122, "Lara Croft explores tombs", "Warner Bros", "14A", 2018-03-01, 2018-11-01, "Warner Supply CO."),
("Game Night", "John Francis Daley", 100, "Weekly game night goes wrong", " New Line Cinema", "R", 2018-03-01, 2018-08-01, "New Line Supply CO.")
;

insert into actors values
("Robert Downey Jr.", "Avengers: Infinity War", "Joss Whedon"),
("Chris Evans", "Avengers: Infinity War", "Joss Whedon"),
("Chadwick Boseman", "Black Panther", "Ryan Coogler"),
("Michael B. Jordan", "Black Panther", "Ryan Coogler"),
("Alicia Vikander", "Tomb Raider", "Roar Uthaug"),
("Daniel Wu", "Tomb Raider", "Roar Uthaug"),
("Rachel McAdams", "Game Night", "John Francis Daley"),
("Jason Bateman", "Game Night", "John Francis Daley")
;

insert into person values
(11111111, "Bob", "Belcher", "Toronto", "Richond", "L3X7H8", "bob@gmail.com", FALSE),
(12345678, "Archer", "Stirling", "Kingston", "William", "K7L3H8", "archer@gmail.com", FALSE),
(00000000, "Ash", "Ketchum", "Kingston", "Aberdeen", "K7L3H9", "ash@gmail.com", FALSE),
(33333333, "Will", "Arnold", "Toronto", "Bermner", "L3X7J8", "will@gmail.com", FALSE),
;

insert into supplier values
("Marvel Supply CO.", "Toronto", "Adelaide","K7L1Y6", 11111111),
("Warner Supply CO.", "Kingston", "Brock","K7M1Y7", 12345678),
("Warner Supply CO.", "Waterloo", "Ezra","K7D1Y6", 00000000)
;

insert into customer values
("1234567898765432","0622", 33333333)
;
	
	