/*
  Warnings:

  - You are about to drop the column `registerId` on the `CompetitionLog` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "CompetitionLog" DROP CONSTRAINT "CompetitionLog_registerId_fkey";

-- AlterTable
ALTER TABLE "CompetitionLog" DROP COLUMN "registerId";
