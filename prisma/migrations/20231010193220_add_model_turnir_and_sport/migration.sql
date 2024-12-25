-- CreateTable
CREATE TABLE "Turnir" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Turnir_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Sport" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "participants" INTEGER NOT NULL,
    "icon_sport" TEXT NOT NULL,
    "data" TEXT NOT NULL,
    "names" TEXT NOT NULL,
    "comandOne" TEXT NOT NULL,
    "comandTwo" TEXT NOT NULL,

    CONSTRAINT "Sport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_SportToTurnir" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_SportToTurnir_AB_unique" ON "_SportToTurnir"("A", "B");

-- CreateIndex
CREATE INDEX "_SportToTurnir_B_index" ON "_SportToTurnir"("B");

-- AddForeignKey
ALTER TABLE "_SportToTurnir" ADD CONSTRAINT "_SportToTurnir_A_fkey" FOREIGN KEY ("A") REFERENCES "Sport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SportToTurnir" ADD CONSTRAINT "_SportToTurnir_B_fkey" FOREIGN KEY ("B") REFERENCES "Turnir"("id") ON DELETE CASCADE ON UPDATE CASCADE;
