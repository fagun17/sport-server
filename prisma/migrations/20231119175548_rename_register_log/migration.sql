/*
  Warnings:

  - You are about to drop the `RegisterLog` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "RegisterLog" DROP CONSTRAINT "RegisterLog_register_id_fkey";

-- DropForeignKey
ALTER TABLE "RegisterLog" DROP CONSTRAINT "RegisterLog_tournament_log_id_fkey";

-- DropForeignKey
ALTER TABLE "RegisterLog" DROP CONSTRAINT "RegisterLog_user_id_fkey";

-- DropTable
DROP TABLE "RegisterLog";

-- CreateTable
CREATE TABLE "Register_log" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "register_id" INTEGER,
    "tournament_log_id" INTEGER,
    "user_id" INTEGER,

    CONSTRAINT "Register_log_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Register_log" ADD CONSTRAINT "Register_log_register_id_fkey" FOREIGN KEY ("register_id") REFERENCES "Register"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Register_log" ADD CONSTRAINT "Register_log_tournament_log_id_fkey" FOREIGN KEY ("tournament_log_id") REFERENCES "Tournament_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Register_log" ADD CONSTRAINT "Register_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
