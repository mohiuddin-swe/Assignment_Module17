/*
  Warnings:

  - The primary key for the `categories` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `categories` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `categories` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - You are about to alter the column `name` on the `categories` table. The data in that column could be lost. The data in that column will be cast from `VarChar(200)` to `VarChar(191)`.
  - You are about to alter the column `user_id` on the `categories` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - The primary key for the `invoices` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `customer_id` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `invoices` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `invoices` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - You are about to alter the column `discount` on the `invoices` table. The data in that column could be lost. The data in that column will be cast from `TinyInt` to `VarChar(191)`.
  - You are about to alter the column `user_id` on the `invoices` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - The primary key for the `products` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `created_at` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `products` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `products` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - You are about to alter the column `user_id` on the `products` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - You are about to alter the column `category_id` on the `products` table. The data in that column could be lost. The data in that column will be cast from `UnsignedBigInt` to `Int`.
  - You are about to alter the column `name` on the `products` table. The data in that column could be lost. The data in that column will be cast from `VarChar(200)` to `VarChar(191)`.
  - You are about to alter the column `img_url` on the `products` table. The data in that column could be lost. The data in that column will be cast from `VarChar(200)` to `VarChar(191)`.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `invoice_products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `Categories` table without a default value. This is not possible if the table is not empty.
  - Added the required column `custmers_id` to the `Invoices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Invoices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Products` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `categories` DROP FOREIGN KEY `categories_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `customers` DROP FOREIGN KEY `customers_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_invoice_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoice_products` DROP FOREIGN KEY `invoice_products_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_customer_id_fkey`;

-- DropForeignKey
ALTER TABLE `invoices` DROP FOREIGN KEY `invoices_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `products` DROP FOREIGN KEY `products_user_id_fkey`;

-- AlterTable
ALTER TABLE `categories` DROP PRIMARY KEY,
    DROP COLUMN `created_at`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `name` VARCHAR(191) NOT NULL,
    MODIFY `user_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `invoices` DROP PRIMARY KEY,
    DROP COLUMN `created_at`,
    DROP COLUMN `customer_id`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `custmers_id` INTEGER NOT NULL,
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `total` VARCHAR(191) NOT NULL,
    MODIFY `discount` VARCHAR(191) NOT NULL,
    MODIFY `vat` VARCHAR(191) NOT NULL,
    MODIFY `payable` VARCHAR(191) NOT NULL,
    MODIFY `user_id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `products` DROP PRIMARY KEY,
    DROP COLUMN `created_at`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `user_id` INTEGER NOT NULL,
    MODIFY `category_id` INTEGER NOT NULL,
    MODIFY `name` VARCHAR(191) NOT NULL,
    MODIFY `price` VARCHAR(191) NOT NULL,
    MODIFY `unit` VARCHAR(191) NOT NULL,
    MODIFY `img_url` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `customers`;

-- DropTable
DROP TABLE `invoice_products`;

-- DropTable
DROP TABLE `users`;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `otp` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_mobile_key`(`mobile`),
    UNIQUE INDEX `User_otp_key`(`otp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Custmers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Custmers_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Invoices_products` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `product_id` INTEGER NOT NULL,
    `invoices_id` INTEGER NOT NULL,
    `cty` VARCHAR(191) NOT NULL,
    `sale_price` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Categories` ADD CONSTRAINT `Categories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `Products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `Products_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `Categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Custmers` ADD CONSTRAINT `Custmers_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices` ADD CONSTRAINT `Invoices_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices` ADD CONSTRAINT `Invoices_custmers_id_fkey` FOREIGN KEY (`custmers_id`) REFERENCES `Custmers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices_products` ADD CONSTRAINT `Invoices_products_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices_products` ADD CONSTRAINT `Invoices_products_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices_products` ADD CONSTRAINT `Invoices_products_invoices_id_fkey` FOREIGN KEY (`invoices_id`) REFERENCES `Invoices`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
