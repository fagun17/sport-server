-- CreateTable
CREATE TABLE "Martial" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "number" TEXT NOT NULL,

    CONSTRAINT "Martial_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Karate" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "fame" TEXT NOT NULL,

    CONSTRAINT "Karate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Box" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "fight" TEXT NOT NULL,

    CONSTRAINT "Box_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_KarateToMartial" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_BoxToMartial" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_KarateToMartial_AB_unique" ON "_KarateToMartial"("A", "B");

-- CreateIndex
CREATE INDEX "_KarateToMartial_B_index" ON "_KarateToMartial"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BoxToMartial_AB_unique" ON "_BoxToMartial"("A", "B");

-- CreateIndex
CREATE INDEX "_BoxToMartial_B_index" ON "_BoxToMartial"("B");

-- AddForeignKey
ALTER TABLE "_KarateToMartial" ADD CONSTRAINT "_KarateToMartial_A_fkey" FOREIGN KEY ("A") REFERENCES "Karate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_KarateToMartial" ADD CONSTRAINT "_KarateToMartial_B_fkey" FOREIGN KEY ("B") REFERENCES "Martial"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BoxToMartial" ADD CONSTRAINT "_BoxToMartial_A_fkey" FOREIGN KEY ("A") REFERENCES "Box"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BoxToMartial" ADD CONSTRAINT "_BoxToMartial_B_fkey" FOREIGN KEY ("B") REFERENCES "Martial"("id") ON DELETE CASCADE ON UPDATE CASCADE;
