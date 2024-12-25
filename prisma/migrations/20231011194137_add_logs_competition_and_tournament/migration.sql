-- CreateTable
CREATE TABLE "CompetitionLog" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "tournamentLogId" INTEGER,
    "competitionId" INTEGER,
    "userId" INTEGER,

    CONSTRAINT "CompetitionLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Competition_time" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "comandOne" INTEGER NOT NULL DEFAULT 0,
    "comandTwo" INTEGER NOT NULL DEFAULT 0,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "competition_log_id" INTEGER,

    CONSTRAINT "Competition_time_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TournamentLog" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER,
    "tournamentId" INTEGER,

    CONSTRAINT "TournamentLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_tournamentLogId_fkey" FOREIGN KEY ("tournamentLogId") REFERENCES "TournamentLog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES "Competition"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompetitionLog" ADD CONSTRAINT "CompetitionLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Competition_time" ADD CONSTRAINT "Competition_time_competition_log_id_fkey" FOREIGN KEY ("competition_log_id") REFERENCES "CompetitionLog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TournamentLog" ADD CONSTRAINT "TournamentLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TournamentLog" ADD CONSTRAINT "TournamentLog_tournamentId_fkey" FOREIGN KEY ("tournamentId") REFERENCES "Tournament"("id") ON DELETE SET NULL ON UPDATE CASCADE;
