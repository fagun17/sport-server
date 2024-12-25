-- CreateTable
CREATE TABLE "Sport_log" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "user_id" INTEGER,
    "turnir_log_id" INTEGER,
    "sport_id" INTEGER,

    CONSTRAINT "Sport_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Turnir_log" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "user_id" INTEGER,
    "turnir_id" INTEGER,

    CONSTRAINT "Turnir_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sport_gall" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "comandOne" INTEGER NOT NULL DEFAULT 0,
    "comandTwo" INTEGER NOT NULL DEFAULT 0,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "sport_log_id" INTEGER,

    CONSTRAINT "Sport_gall_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Sport_log" ADD CONSTRAINT "Sport_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sport_log" ADD CONSTRAINT "Sport_log_turnir_log_id_fkey" FOREIGN KEY ("turnir_log_id") REFERENCES "Turnir_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sport_log" ADD CONSTRAINT "Sport_log_sport_id_fkey" FOREIGN KEY ("sport_id") REFERENCES "Sport"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Turnir_log" ADD CONSTRAINT "Turnir_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Turnir_log" ADD CONSTRAINT "Turnir_log_turnir_id_fkey" FOREIGN KEY ("turnir_id") REFERENCES "Turnir"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sport_gall" ADD CONSTRAINT "Sport_gall_sport_log_id_fkey" FOREIGN KEY ("sport_log_id") REFERENCES "Sport_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;
