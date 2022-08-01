CREATE TABLE "public.users" (
	"userId" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"category" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	"mainImgId" int NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"orderStatus" TEXT NOT NULL,
	"buyDate" DATE NOT NULL,
	"address" TEXT NOT NULL,
	"userId" TEXT NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.image" (
	"id" serial NOT NULL,
	"url" serial NOT NULL,
	"productId" int NOT NULL,
	CONSTRAINT "image_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ordersList" (
	"id" serial NOT NULL,
	"orderId" int NOT NULL,
	"productId" int NOT NULL,
	"quantity" int NOT NULL,
	"paidValue" int NOT NULL,
	CONSTRAINT "ordersList_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("mainImgId") REFERENCES "image"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");

ALTER TABLE "image" ADD CONSTRAINT "image_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "ordersList" ADD CONSTRAINT "ordersList_fk0" FOREIGN KEY ("orderId") REFERENCES "orders"("id");
ALTER TABLE "ordersList" ADD CONSTRAINT "ordersList_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");






