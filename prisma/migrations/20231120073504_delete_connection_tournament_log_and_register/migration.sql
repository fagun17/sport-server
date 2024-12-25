/*
  Warnings:

  - You are about to drop the column `tournamentLogId` on the `Register` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Register" DROP CONSTRAINT "Register_tournamentLogId_fkey";

-- AlterTable
ALTER TABLE "Register" DROP COLUMN "tournamentLogId";
