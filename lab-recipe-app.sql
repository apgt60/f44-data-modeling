CREATE TABLE "user" (
	"id" serial NOT NULL,
	"email" varchar(30) NOT NULL UNIQUE,
	"passhash" varchar(250) NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
);

CREATE TABLE "recipe" (
	"id" serial NOT NULL,
	"owner" integer NOT NULL,
	"is_public" BOOLEAN NOT NULL,
	CONSTRAINT "recipe_pk" PRIMARY KEY ("id")
);

CREATE TABLE "ingredient" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL UNIQUE,
	CONSTRAINT "ingredient_pk" PRIMARY KEY ("id")
);

CREATE TABLE "grocery_list" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"owner_id" integer NOT NULL,
	CONSTRAINT "grocery_list_pk" PRIMARY KEY ("id")
);

CREATE TABLE "recipe_ingredient" (
	"id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "recipe_ingredient_pk" PRIMARY KEY ("id")
);
  
CREATE TABLE "occassion_recipe" (
	"id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"occasion_id" integer NOT NULL,
	CONSTRAINT "occassion_recipe_pk" PRIMARY KEY ("id")
);

CREATE TABLE "occasion" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"owner_id" integer NOT NULL,
	CONSTRAINT "occasion_pk" PRIMARY KEY ("id")
);

CREATE TABLE "grocery_list_ingredient" (
	"id" serial NOT NULL,
	"grocery_list_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	CONSTRAINT "grocery_list_ingredient_pk" PRIMARY KEY ("id")
);


ALTER TABLE "recipe" ADD CONSTRAINT "recipe_fk0" FOREIGN KEY ("owner") REFERENCES "user"("id");


ALTER TABLE "grocery_list" ADD CONSTRAINT "grocery_list_fk0" FOREIGN KEY ("owner_id") REFERENCES "user"("id");

ALTER TABLE "recipe_ingredient" ADD CONSTRAINT "recipe_ingredient_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipe"("id");
ALTER TABLE "recipe_ingredient" ADD CONSTRAINT "recipe_ingredient_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredient"("id");

ALTER TABLE "occassion_recipe" ADD CONSTRAINT "occassion_recipe_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipe"("id");
ALTER TABLE "occassion_recipe" ADD CONSTRAINT "occassion_recipe_fk1" FOREIGN KEY ("occasion_id") REFERENCES "occasion"("id");

ALTER TABLE "occasion" ADD CONSTRAINT "occasion_fk0" FOREIGN KEY ("owner_id") REFERENCES "user"("id");

ALTER TABLE "grocery_list_ingredient" ADD CONSTRAINT "grocery_list_ingredient_fk0" FOREIGN KEY ("grocery_list_id") REFERENCES "grocery_list"("id");
ALTER TABLE "grocery_list_ingredient" ADD CONSTRAINT "grocery_list_ingredient_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredient"("id");
