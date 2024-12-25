-- CreateTable
CREATE TABLE "RegisterLog" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_completed" BOOLEAN NOT NULL DEFAULT false,
    "register_id" INTEGER,
    "tournament_log_id" INTEGER,
    "user_id" INTEGER,

    CONSTRAINT "RegisterLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "RegisterLog" ADD CONSTRAINT "RegisterLog_register_id_fkey" FOREIGN KEY ("register_id") REFERENCES "Register"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegisterLog" ADD CONSTRAINT "RegisterLog_tournament_log_id_fkey" FOREIGN KEY ("tournament_log_id") REFERENCES "Tournament_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RegisterLog" ADD CONSTRAINT "RegisterLog_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
