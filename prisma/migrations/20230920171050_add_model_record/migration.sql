-- CreateTable
CREATE TABLE "Record" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "names" TEXT NOT NULL,
    "lastNames" TEXT NOT NULL,
    "nameNames" TEXT NOT NULL,
    "viewHalls" TEXT NOT NULL,
    "typeWorkouts" TEXT NOT NULL,
    "coaches" TEXT NOT NULL,
    "viewWorkouts" TEXT NOT NULL,
    "dateTime" TEXT NOT NULL,
    "timeDate" TEXT NOT NULL,

    CONSTRAINT "Record_pkey" PRIMARY KEY ("id")
);
