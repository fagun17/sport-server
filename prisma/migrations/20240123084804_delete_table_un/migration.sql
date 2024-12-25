/*
  Warnings:

  - You are about to drop the `_BoxToMartial` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_KarateToMartial` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_SchoolToTest` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_TestToUniversity` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_BoxToMartial" DROP CONSTRAINT "_BoxToMartial_A_fkey";

-- DropForeignKey
ALTER TABLE "_BoxToMartial" DROP CONSTRAINT "_BoxToMartial_B_fkey";

-- DropForeignKey
ALTER TABLE "_KarateToMartial" DROP CONSTRAINT "_KarateToMartial_A_fkey";

-- DropForeignKey
ALTER TABLE "_KarateToMartial" DROP CONSTRAINT "_KarateToMartial_B_fkey";

-- DropForeignKey
ALTER TABLE "_SchoolToTest" DROP CONSTRAINT "_SchoolToTest_A_fkey";

-- DropForeignKey
ALTER TABLE "_SchoolToTest" DROP CONSTRAINT "_SchoolToTest_B_fkey";

-- DropForeignKey
ALTER TABLE "_TestToUniversity" DROP CONSTRAINT "_TestToUniversity_A_fkey";

-- DropForeignKey
ALTER TABLE "_TestToUniversity" DROP CONSTRAINT "_TestToUniversity_B_fkey";

-- DropTable
DROP TABLE "_BoxToMartial";

-- DropTable
DROP TABLE "_KarateToMartial";

-- DropTable
DROP TABLE "_SchoolToTest";

-- DropTable
DROP TABLE "_TestToUniversity";
