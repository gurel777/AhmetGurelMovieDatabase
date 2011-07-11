CREATE TABLE "Professions" (
	"MovieID" int8 NOT NULL,
	"PersonID" int8 NOT NULL,
	"ProfessionType" varchar(25),
	"Role" varchar(50)[]
);


CREATE TABLE "PersonGenre" (
	"PersonID" int8 NOT NULL,
	"GenreID" int8 NOT NULL
);


CREATE TABLE "MovieAwards" (
	"MovieID" int8 NOT NULL,
	"PersonID" int8 NOT NULL,
	"EpisodeID" int8 NOT NULL,
	"Year" date[],
	"Award" varchar(200)[]
);


CREATE TABLE "Episode" (
	"EpisodeID" BIGSERIAL NOT NULL,
	"MovieID" int8 NOT NULL,
	"EpisodNo" int8,
	"SeasonNo" int8,
  PRIMARY KEY("EpisodeID")
);


CREATE TABLE "User" (
	"UserID" BIGSERIAL NOT NULL,
	"MovieID" int8 NOT NULL,
	"UserName" varchar(50) NOT NULL,
	"UserSurname" varchar(50) NOT NULL,
	"UserEmail" varchar(15) NOT NULL,
  PRIMARY KEY("UserID")
);


CREATE TABLE "Person" (
	"PersonID" BIGSERIAL NOT NULL,
	"PersonName" varchar[] NOT NULL,
	"PersonSurname" varchar(50)[] NOT NULL,
	"PersonSex" char(1) NOT NULL,
	"PersonBirthday" date[],
	"PersonDeath" date,
	"Rating" int8,
	"PeopleURL" char(100),
  PRIMARY KEY("PersonID")
);


CREATE TABLE "MovieGenre" (
	"GenreID" int8 NOT NULL,
	"MovieID" int8 NOT NULL
);


CREATE TABLE "Genre" (
	"GenreID" BIGSERIAL NOT NULL,
	"Genre" varchar[],
  PRIMARY KEY("GenreID")
);


CREATE TABLE "MovieImages" (
	"MovieID" int8,
	"ImgPath" varchar(100)[],
	"ImgInfo" varchar(200)[]
);


CREATE TABLE "Movies" (
	"MovieID" BIGSERIAL NOT NULL,
	"EpisodeID" int8 NOT NULL,
	"MovieTitle" text NOT NULL,
	"ReleaseDate" date[] NOT NULL,
	"MovieGenre" int8 NOT NULL,
	"MovieURL" varchar[],
	"MovieAbstract" varchar[] NOT NULL,
	"Rating" int8 NOT NULL DEFAULT 1,
	"UserID" int8 NOT NULL,
  PRIMARY KEY("MovieID")
)
WITH OIDS;


ALTER TABLE "Professions"
   ADD CONSTRAINT "Ref_Professions_to_Movies" FOREIGN KEY ("MovieID")
    REFERENCES "Movies"("MovieID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE,
   ADD CONSTRAINT "Ref_Professions_to_Person" FOREIGN KEY ("PersonID")
    REFERENCES "Person"("PersonID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "PersonGenre"
   ADD CONSTRAINT "Ref_PersonGenre_to_Person" FOREIGN KEY ("PersonID")
    REFERENCES "Person"("PersonID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE,
   ADD CONSTRAINT "Ref_PersonGenre_to_Genre" FOREIGN KEY ("GenreID")
    REFERENCES "Genre"("GenreID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "MovieAwards"
   ADD CONSTRAINT "Ref_MovieAwards_to_Movies" FOREIGN KEY ("MovieID")
    REFERENCES "Movies"("MovieID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE,
   ADD CONSTRAINT "Ref_MovieAwards_to_Person" FOREIGN KEY ("PersonID")
    REFERENCES "Person"("PersonID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "Episode"
   ADD CONSTRAINT "Ref_EPISODE_to_Movies" FOREIGN KEY ("MovieID")
    REFERENCES "Movies"("MovieID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "User"
   ADD CONSTRAINT "Ref_User_to_Movies" FOREIGN KEY ("MovieID")
    REFERENCES "Movies"("MovieID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "MovieGenre"
   ADD CONSTRAINT "Ref_MovieGenre_to_Genre" FOREIGN KEY ("GenreID")
    REFERENCES "Genre"("GenreID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE,
   ADD CONSTRAINT "Ref_MovieGenre_to_Movies" FOREIGN KEY ("MovieID")
    REFERENCES "Movies"("MovieID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "MovieImages"
   ADD CONSTRAINT "Ref_Images_to_Movies" FOREIGN KEY ("MovieID")
    REFERENCES "Movies"("MovieID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;

ALTER TABLE "Movies"
   ADD CONSTRAINT "Ref_Movies_to_EPISODE" FOREIGN KEY ("EpisodeID")
    REFERENCES "Episode"("EpisodeID")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
      NOT DEFERRABLE;
