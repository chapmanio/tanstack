-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "avatar_color" TEXT,
    "bio" TEXT,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "session_token" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "expires" TIMESTAMP(6) NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationCode" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "code" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "expires" TIMESTAMP(6) NOT NULL,
    "used" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "VerificationCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserPermission" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "permission_id" UUID NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserPermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "code" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER NOT NULL,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Activity" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" INTEGER NOT NULL,
    "entity_type" TEXT NOT NULL,
    "entity_id" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "description" TEXT,
    "metadata" JSONB,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "house_number" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "town" TEXT NOT NULL,
    "postcode" TEXT NOT NULL,
    "phone" TEXT,
    "mobile" TEXT,
    "email" TEXT NOT NULL,
    "created_by_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Warranty" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "warranty_id" TEXT NOT NULL,
    "warranty_start_date" DATE NOT NULL,
    "warranty_expiry_date" DATE NOT NULL,
    "warranty_registration_date" DATE NOT NULL,
    "plan" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER NOT NULL,
    "dealership_id" INTEGER,

    CONSTRAINT "Warranty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WarrantyStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER NOT NULL,

    CONSTRAINT "WarrantyStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClaimStatus" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,

    CONSTRAINT "ClaimStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vehicle" (
    "id" SERIAL NOT NULL,
    "warranty_id" INTEGER NOT NULL,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "mileage" INTEGER,
    "registration" TEXT NOT NULL,
    "registration_date" DATE,
    "price" INTEGER,
    "created_by_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Claim" (
    "id" SERIAL NOT NULL,
    "warranty_id" INTEGER NOT NULL,
    "repairer_id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER NOT NULL,

    CONSTRAINT "Claim_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Repairer" (
    "id" SERIAL NOT NULL,
    "companyName" TEXT NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "addressLine2" TEXT,
    "town" TEXT NOT NULL,
    "postcode" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "contactName" TEXT,
    "createdById" INTEGER NOT NULL,

    CONSTRAINT "Repairer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RepairCost" (
    "id" SERIAL NOT NULL,
    "claimId" INTEGER NOT NULL,
    "vehicleMileage" INTEGER NOT NULL,
    "diagnosis" TEXT NOT NULL,
    "prognosis" TEXT NOT NULL,
    "labourRate" INTEGER NOT NULL,
    "labourTime" INTEGER NOT NULL,
    "createdById" INTEGER NOT NULL,

    CONSTRAINT "RepairCost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Part" (
    "id" SERIAL NOT NULL,
    "claimId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "unitPrice" INTEGER NOT NULL,
    "labourRate" INTEGER NOT NULL DEFAULT 0,
    "labourTime" INTEGER NOT NULL DEFAULT 0,
    "createdById" INTEGER NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Part_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dealership" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address_line1" TEXT NOT NULL,
    "address_line2" TEXT,
    "town" TEXT NOT NULL,
    "postcode" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "contact_name" TEXT,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by_id" INTEGER,
    "updated_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Dealership_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Media" (
    "id" SERIAL NOT NULL,
    "claimId" INTEGER NOT NULL,
    "mimeType" TEXT,
    "url" TEXT,
    "description" TEXT,
    "createdById" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Note" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "resourceType" TEXT NOT NULL,
    "resourceId" TEXT NOT NULL,
    "createdById" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Note_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_unique" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "sessions_session_token_unique" ON "Session"("session_token");

-- CreateIndex
CREATE INDEX "Session_userId_idx" ON "Session"("userId");

-- CreateIndex
CREATE INDEX "VerificationCode_email_idx" ON "VerificationCode"("email");

-- CreateIndex
CREATE INDEX "VerificationCode_user_id_idx" ON "VerificationCode"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "verification_codes_email_code_idx" ON "VerificationCode"("email", "code");

-- CreateIndex
CREATE UNIQUE INDEX "user_permission_idx" ON "UserPermission"("user_id", "permission_id");

-- CreateIndex
CREATE UNIQUE INDEX "permissions_code_unique" ON "Permission"("code");

-- CreateIndex
CREATE INDEX "Permission_created_by_id_idx" ON "Permission"("created_by_id");

-- CreateIndex
CREATE INDEX "Activity_user_id_idx" ON "Activity"("user_id");

-- CreateIndex
CREATE INDEX "Activity_entity_type_entity_id_idx" ON "Activity"("entity_type", "entity_id");

-- CreateIndex
CREATE INDEX "Activity_created_at_idx" ON "Activity"("created_at");

-- CreateIndex
CREATE INDEX "Warranty_customer_id_idx" ON "Warranty"("customer_id");

-- CreateIndex
CREATE INDEX "Warranty_status_id_idx" ON "Warranty"("status_id");

-- CreateIndex
CREATE INDEX "Warranty_warranty_id_idx" ON "Warranty"("warranty_id");

-- CreateIndex
CREATE INDEX "Warranty_dealership_id_idx" ON "Warranty"("dealership_id");

-- CreateIndex
CREATE UNIQUE INDEX "Warranty_status_name_unique" ON "WarrantyStatus"("name");

-- CreateIndex
CREATE INDEX "WarrantyStatus_name_idx" ON "WarrantyStatus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "claim_status_name_unique" ON "ClaimStatus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "claim_status_order_unique" ON "ClaimStatus"("order");

-- CreateIndex
CREATE INDEX "ClaimStatus_name_idx" ON "ClaimStatus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "vehicles_warranty_id_unique" ON "Vehicle"("warranty_id");

-- CreateIndex
CREATE INDEX "Vehicle_registration_idx" ON "Vehicle"("registration");

-- CreateIndex
CREATE INDEX "Vehicle_warranty_id_idx" ON "Vehicle"("warranty_id");

-- CreateIndex
CREATE INDEX "Claim_repairer_id_idx" ON "Claim"("repairer_id");

-- CreateIndex
CREATE INDEX "Claim_status_id_idx" ON "Claim"("status_id");

-- CreateIndex
CREATE INDEX "Claim_warranty_id_idx" ON "Claim"("warranty_id");

-- CreateIndex
CREATE INDEX "Repairer_companyName_idx" ON "Repairer"("companyName");

-- CreateIndex
CREATE INDEX "RepairCost_claimId_idx" ON "RepairCost"("claimId");

-- CreateIndex
CREATE INDEX "Part_claimId_idx" ON "Part"("claimId");

-- CreateIndex
CREATE INDEX "Media_claimId_idx" ON "Media"("claimId");

-- CreateIndex
CREATE INDEX "Note_createdById_idx" ON "Note"("createdById");

-- CreateIndex
CREATE INDEX "notes_resourceIdx" ON "Note"("resourceType", "resourceId");

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "sessions_userId_usersId_fk" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "VerificationCode" ADD CONSTRAINT "verification_codes_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UserPermission" ADD CONSTRAINT "user_permissions_permission_id_permissions_id_fk" FOREIGN KEY ("permission_id") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UserPermission" ADD CONSTRAINT "user_permissions_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Permission" ADD CONSTRAINT "Permission_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Activity" ADD CONSTRAINT "Activity_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Warranty" ADD CONSTRAINT "Warranty_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Warranty" ADD CONSTRAINT "Warranty_dealership_id_fkey" FOREIGN KEY ("dealership_id") REFERENCES "Dealership"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Warranty" ADD CONSTRAINT "warranties_customer_id_customers_id_fk" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Warranty" ADD CONSTRAINT "warranties_status_id_statuses_id_fk" FOREIGN KEY ("status_id") REFERENCES "WarrantyStatus"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "WarrantyStatus" ADD CONSTRAINT "WarrantyStatus_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClaimStatus" ADD CONSTRAINT "ClaimStatus_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "vehicles_warranty_id_warranties_id_fk" FOREIGN KEY ("warranty_id") REFERENCES "Warranty"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Claim" ADD CONSTRAINT "Claim_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Claim" ADD CONSTRAINT "claims_customer_id_customers_id_fk" FOREIGN KEY ("customer_id") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Claim" ADD CONSTRAINT "claims_repairer_id_repairers_id_fk" FOREIGN KEY ("repairer_id") REFERENCES "Repairer"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Claim" ADD CONSTRAINT "claims_status_id_claim_statuses_id_fk" FOREIGN KEY ("status_id") REFERENCES "ClaimStatus"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Claim" ADD CONSTRAINT "claims_warranty_id_warranties_id_fk" FOREIGN KEY ("warranty_id") REFERENCES "Warranty"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Repairer" ADD CONSTRAINT "Repairer_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RepairCost" ADD CONSTRAINT "RepairCost_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RepairCost" ADD CONSTRAINT "repair_costs_claimId_claimsId_fk" FOREIGN KEY ("claimId") REFERENCES "Claim"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Part" ADD CONSTRAINT "Part_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Part" ADD CONSTRAINT "parts_claimId_claimsId_fk" FOREIGN KEY ("claimId") REFERENCES "Claim"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Dealership" ADD CONSTRAINT "Dealership_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Media" ADD CONSTRAINT "Media_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Media" ADD CONSTRAINT "media_claimId_claimsId_fk" FOREIGN KEY ("claimId") REFERENCES "Claim"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Note" ADD CONSTRAINT "notes_created_byId_usersId_fk" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;
