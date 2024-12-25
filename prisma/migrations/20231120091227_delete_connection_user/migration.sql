/*
  Warnings:

  - You are about to drop the column `userId` on the `Register` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Register" DROP CONSTRAINT "Register_userId_fkey";

-- AlterTable
ALTER TABLE "Register" DROP COLUMN "userId";
