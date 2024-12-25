-- AlterTable
ALTER TABLE "Register" ADD COLUMN     "tournamentLogId" INTEGER;

-- AddForeignKey
ALTER TABLE "Register" ADD CONSTRAINT "Register_tournamentLogId_fkey" FOREIGN KEY ("tournamentLogId") REFERENCES "Tournament_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;
