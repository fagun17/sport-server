-- AlterTable
ALTER TABLE "CompetitionLog" ADD COLUMN     "registerId" INTEGER;

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_registerId_fkey" FOREIGN KEY ("registerId") REFERENCES "Register"("id") ON DELETE SET NULL ON UPDATE CASCADE;
