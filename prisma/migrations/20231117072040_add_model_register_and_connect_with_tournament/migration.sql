-- CreateTable
CREATE TABLE "Register" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "fullName" TEXT NOT NULL,
    "tabNumber" TEXT NOT NULL,

    CONSTRAINT "Register_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_RegisterToTournament" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_RegisterToTournament_AB_unique" ON "_RegisterToTournament"("A", "B");

-- CreateIndex
CREATE INDEX "_RegisterToTournament_B_index" ON "_RegisterToTournament"("B");

-- AddForeignKey
ALTER TABLE "_RegisterToTournament" ADD CONSTRAINT "_RegisterToTournament_A_fkey" FOREIGN KEY ("A") REFERENCES "Register"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RegisterToTournament" ADD CONSTRAINT "_RegisterToTournament_B_fkey" FOREIGN KEY ("B") REFERENCES "Tournament"("id") ON DELETE CASCADE ON UPDATE CASCADE;
