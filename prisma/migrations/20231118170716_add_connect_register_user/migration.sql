-- AlterTable
ALTER TABLE "Register" ADD COLUMN     "userId" INTEGER;

-- AddForeignKey
ALTER TABLE "Register" ADD CONSTRAINT "Register_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
