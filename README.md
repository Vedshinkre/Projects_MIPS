# MIPS IBAN Calculator
## Project Overview
This project is a MIPS assembly implementation of a German IBAN (International Bank Account Number) calculator. The program is capable of converting a bank account number (KNR) and a bank code (BLZ) into a German IBAN and vice versa. Additionally, the project includes functionality to validate IBAN check digits and perform arithmetic operations on large numbers as strings.

## Features
### Extract BLZ and KNR from IBAN:
Extracts the bank code (BLZ) and the account number (KNR) from a 22-character German IBAN.
### Remainder Calculation: 
Computes the remainder of a large number (provided as a string) when divided by a given divisor using a method based on Horner's schema.
### IBAN Check Digit Validation:
Validates the check digits of a German IBAN by converting the IBAN into a numeric format and calculating the remainder when divided by 97.
### Generate IBAN: 
Generates a valid German IBAN from a given bank code (BLZ) and account number (KNR), including the calculation of check digits.

## Prerequisites
### To work with this project, you will need:
MARS MIPS Simulator installed and configured on your machine.
A basic understanding of MIPS assembly language.
Knowledge of IBAN structure and validation rules.
