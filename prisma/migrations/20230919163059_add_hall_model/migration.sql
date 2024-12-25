-- CreateTable
CREATE TABLE "Hall" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "viewHall" TEXT NOT NULL,
    "typeWorkout" TEXT NOT NULL,
    "coach" TEXT NOT NULL,
    "viewWorkout" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,

    CONSTRAINT "Hall_pkey" PRIMARY KEY ("id")
);
