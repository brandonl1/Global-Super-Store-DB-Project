-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_super_store` DEFAULT CHARACTER SET utf8mb3 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Bookings` (
  `BookingID` INT GENERATED ALWAYS AS (),
  `TableNo` INT ZEROFILL NULL DEFAULT NULL,
  `GuestFirstName` VARCHAR(100) BINARY NULL DEFAULT NULL,
  `GuestLastName` VARCHAR(100) BINARY NULL DEFAULT NULL,
  `BookingSlot` TIME NULL DEFAULT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  `BookingDate` DATE NULL DEFAULT NULL,
  `TableNumber` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  UNIQUE INDEX `GuestLastName_UNIQUE` (`GuestLastName` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NULL DEFAULT NULL,
  `Role` VARCHAR(100) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `Contact_Number` INT NULL DEFAULT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Annual_Salary` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`MenuItems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL DEFAULT NULL,
  `Type` VARCHAR(100) NULL DEFAULT NULL,
  `Price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB
AUTO_INCREMENT = 1497
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Menus` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`, `ItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `TableNo` INT NOT NULL,
  `MenuID` INT NULL DEFAULT NULL,
  `BookingID` INT NULL DEFAULT NULL,
  `BillAmount` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`, `TableNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `global_super_store` ;

-- -----------------------------------------------------
-- Table `global_super_store`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Address` (
  `AddressID` INT NOT NULL,
  `City` VARCHAR(100) NOT NULL,
  `State` VARCHAR(100) NOT NULL,
  `Country` VARCHAR(100) NOT NULL,
  `PostalCode` INT NOT NULL,
  `Region` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `global_super_store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Customers` (
  `CustomerID` VARCHAR(100) NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `Segment` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `global_super_store`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Products` (
  `ProductID` VARCHAR(100) NOT NULL,
  `ProductName` VARCHAR(255) NOT NULL,
  `Category` VARCHAR(100) NOT NULL,
  `Sub-category` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `global_super_store`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Orders` (
  `OrderID` VARCHAR(100) NOT NULL,
  `ProductID` VARCHAR(100) NOT NULL,
  `CustomerID` VARCHAR(100) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Market` VARCHAR(100) NOT NULL,
  `OrderPriority` VARCHAR(50) NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `ProductID_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `customerId_fk_orders`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `global_super_store`.`Customers` (`CustomerID`),
  CONSTRAINT `productId_fk_orders`
    FOREIGN KEY (`ProductID`)
    REFERENCES `global_super_store`.`Products` (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `global_super_store`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Sales` (
  `OrderID` VARCHAR(100) NOT NULL,
  `Slaes` DECIMAL(10,0) NOT NULL,
  `Discount` DECIMAL(10,0) NOT NULL,
  `Profit` DECIMAL(10,0) NOT NULL,
  `ShippingCost` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `orderId_fk_sales`
    FOREIGN KEY (`OrderID`)
    REFERENCES `global_super_store`.`Orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `global_super_store`.`Sales_`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Sales_` (
  `SalesID` INT NOT NULL,
  `Price` DECIMAL(10,0) NOT NULL,
  `Cost` DECIMAL(10,0) NOT NULL,
  `Discount` DECIMAL(10,0) NOT NULL,
  `ShippingCost` DECIMAL(10,0) NOT NULL,
  `Quantity` INT NOT NULL,
  `LocationID` INT NULL DEFAULT NULL,
  `TimeID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`SalesID`),
  INDEX `locationId_fk_idx` (`LocationID` ASC) VISIBLE,
  INDEX `timeId_fk_idx` (`TimeID` ASC) VISIBLE,
  INDEX `productId_fk_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `locationId_fk`
    FOREIGN KEY (`LocationID`)
    REFERENCES `global_super_store`.`Location` (`LocationID`),
  CONSTRAINT `productId_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `global_super_store`.`Products_` (`ProductID`),
  CONSTRAINT `timeId_fk`
    FOREIGN KEY (`TimeID`)
    REFERENCES `global_super_store`.`Time` (`TimeID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `global_super_store`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Shipping` (
  `OrderID` VARCHAR(100) NOT NULL,
  `AddressID` INT NOT NULL,
  `ShippingDate` DATE NOT NULL,
  `ShippingMode` VARCHAR(100) NOT NULL,
  `ShippingCost` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `addressId_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `global_super_store`.`Address` (`AddressID`),
  CONSTRAINT `orderId_fk_shipping`
    FOREIGN KEY (`OrderID`)
    REFERENCES `global_super_store`.`Orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
