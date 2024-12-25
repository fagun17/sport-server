/*
  Warnings:

  - You are about to drop the column `competitionId` on the `CompetitionLog` table. All the data in the column will be lost.
  - You are about to drop the column `tournamentLogId` on the `CompetitionLog` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `CompetitionLog` table. All the data in the column will be lost.
  - You are about to drop the `TournamentLog` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CompetitionLog" DROP CONSTRAINT "CompetitionLog_competitionId_fkey";

-- DropForeignKey
ALTER TABLE "CompetitionLog" DROP CONSTRAINT "CompetitionLog_tournamentLogId_fkey";

-- DropForeignKey
ALTER TABLE "CompetitionLog" DROP CONSTRAINT "CompetitionLog_userId_fkey";

-- DropForeignKey
ALTER TABLE "TournamentLog" DROP CONSTRAINT "TournamentLog_tournamentId_fkey";

-- DropForeignKey
ALTER TABLE "TournamentLog" DROP CONSTRAINT "TournamentLog_userId_fkey";

-- AlterTable
ALTER TABLE "CompetitionLog" DROP COLUMN "competitionId",
DROP COLUMN "tournamentLogId",
DROP COLUMN "userId",
ADD COLUMN     "competition_id" INTEGER,
ADD COLUMN     "is_completed" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "tournament_log_id" INTEGER,
ADD COLUMN     "user_id" INTEGER;

-- DropTable
DROP TABLE "TournamentLog";

-- CreateTable
CREATE TABLE "Tournament_log" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "user_id" INTEGER,
    "tournament_id" INTEGER,

    CONSTRAINT "Tournament_log_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_tournament_log_id_fkey" FOREIGN KEY ("tournament_log_id") REFERENCES "Tournament_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_competition_id_fkey" FOREIGN KEY ("competition_id") REFERENCES "Competition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tournament_log" ADD CONSTRAINT "Tournament_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tournament_log" ADD CONSTRAINT "Tournament_log_tournament_id_fkey" FOREIGN KEY ("tournament_id") REFERENCES "Tournament"("id") ON DELETE SET NULL ON UPDATE CASCADE;
