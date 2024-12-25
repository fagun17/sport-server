/*
  Warnings:

  - You are about to drop the `Hall` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Sport` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Sport_gall` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Sport_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Turnir` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Turnir_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SportToTurnir` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Sport_gall" DROP CONSTRAINT "Sport_gall_sport_log_id_fkey";

-- DropForeignKey
ALTER TABLE "Sport_log" DROP CONSTRAINT "Sport_log_sport_id_fkey";

-- DropForeignKey
ALTER TABLE "Sport_log" DROP CONSTRAINT "Sport_log_turnir_log_id_fkey";

-- DropForeignKey
ALTER TABLE "Sport_log" DROP CONSTRAINT "Sport_log_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Turnir_log" DROP CONSTRAINT "Turnir_log_turnir_id_fkey";

-- DropForeignKey
ALTER TABLE "Turnir_log" DROP CONSTRAINT "Turnir_log_user_id_fkey";

-- DropForeignKey
ALTER TABLE "_SportToTurnir" DROP CONSTRAINT "_SportToTurnir_A_fkey";

-- DropForeignKey
ALTER TABLE "_SportToTurnir" DROP CONSTRAINT "_SportToTurnir_B_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "key" INTEGER;

-- DropTable
DROP TABLE "Hall";

-- DropTable
DROP TABLE "Sport";

-- DropTable
DROP TABLE "Sport_gall";

-- DropTable
DROP TABLE "Sport_log";

-- DropTable
DROP TABLE "Turnir";

-- DropTable
DROP TABLE "Turnir_log";

-- DropTable
DROP TABLE "_SportToTurnir";
