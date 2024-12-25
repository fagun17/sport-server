-- CreateTable
CREATE TABLE "Competition" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "icon_sport" TEXT NOT NULL,
    "times" INTEGER NOT NULL,
    "data" TEXT NOT NULL,
    "names" TEXT NOT NULL,
    "comandOne" TEXT NOT NULL,
    "comandTwo" TEXT NOT NULL,

    CONSTRAINT "Competition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tournament" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Tournament_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CompetitionToTournament" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CompetitionToTournament_AB_unique" ON "_CompetitionToTournament"("A", "B");

-- CreateIndex
CREATE INDEX "_CompetitionToTournament_B_index" ON "_CompetitionToTournament"("B");

-- AddForeignKey
ALTER TABLE "_CompetitionToTournament" ADD CONSTRAINT "_CompetitionToTournament_A_fkey" FOREIGN KEY ("A") REFERENCES "Competition"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetitionToTournament" ADD CONSTRAINT "_CompetitionToTournament_B_fkey" FOREIGN KEY ("B") REFERENCES "Tournament"("id") ON DELETE CASCADE ON UPDATE CASCADE;
