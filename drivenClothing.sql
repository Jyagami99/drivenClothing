CREATE TABLE "public.products" (
  "id" serial NOT NULL,
  "name" serial NOT NULL,
  "price" serial NOT NULL,
  "size" TEXT NOT NULL,
  "pictureUri" serial NOT NULL,
  "categoryId" int NOT NULL,
  CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
CREATE TABLE "public.users" (
  "id" serial NOT NULL,
  "name" serial,
  "email" serial,
  "password" serial,
  "address" TEXT NOT NULL,
  CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
CREATE TABLE "public.category" (
  "id" serial NOT NULL,
  "name" TEXT NOT NULL,
  CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
CREATE TABLE "public.checkout" (
  "id" serial NOT NULL,
  "purchaseId" int NOT NULL,
  "status" TEXT NOT NULL,
  "date" DATE NOT NULL,
  CONSTRAINT "checkout_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
CREATE TABLE "public.purchases" (
  "id" serial NOT NULL,
  "userId" int NOT NULL,
  "productId" int NOT NULL,
  "quantity" int NOT NULL,
  CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);
ALTER TABLE "products"
ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "category"("id");
ALTER TABLE "checkout"
ADD CONSTRAINT "checkout_fk0" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");
ALTER TABLE "purchases"
ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases"
ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");