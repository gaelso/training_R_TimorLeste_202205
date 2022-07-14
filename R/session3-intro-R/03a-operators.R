
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)


## === Note: 
## Comments: All the text following the symbol # is comment, R is not going to interpret it
## You can use it to explain and decorate your code
## ---- 4 or more signs like #, - or = will make sections in the code in R studio, 
## ---- see Code > Insert Section... or Ctrl + Shift + R
## +++ Exercises are marked with 3 + signs +++
## === Notes will be surrounded with 3 = signs ===
## ===

## 01. Introduction ----

## 02. Calculations ----



## --- Operators ------------------------------------------------------------

## Maths operators
1 + 1
1 - 3
24 / 12
5^3
((10 + 15) / 5) - 3 * 2
pi


# +++ EX 1 +++
# 1. What is the product of 123 and 26?
# 2. Multiply 3 with 12. Add 15 and divide all by 25.
# +++

123 * 26
((3 * 12) + 15) / 25

## +++ EX 1b +++
## 1. Divide 429 by 9840
## 2. Multiply 56 by 385, add 539 and divide all by 100
## +++

429 / 9840

((56 * 385) + 539) / 100


## EX
(3 * (5 / 3)) + (5 * (6 / 7)) + (2 * (1 / 4))
3 * 5 / 3 + 5 * 6 / 7 + 2 * 1 / 4

## (X°F - 32) x .5556 = Y°C
## Y°C / .5556 + 32 = X°F
(100 - 32) * .5556
(100 / .5556) + 32

## Comparison
2 < 3
2 <= 2 
2 == 2 
2 != 3
2 > 3
2 >= 3


## Assign
a <- 1
print(a)
a

b = 3

b


## Why to use "<-" instead of "="

## Result of throwing 1 dice 10 times
sample(x = 1:6, size = 10, replace = TRUE)

## Select randomly 5 values between 1 and 100
test <- sample(x = 1:100, size = 5, replace = FALSE)
test

## === NOTE:
## Good practice, always use <- to assign, it makes the code easier to read ===
## ===

## +++ EX 2 +++
## 1. Create an object aa with the value 14 + 10
## 2. Create an object bb with the value aa / 3 + 16
## 3. Check if aa is different from bb
## 4. Store the result in an object cc 
## +++

aa <- 14 + 10
bb <- aa / 3 + 16

aa != bb
aa == bb

cc <- aa != bb

cc

## END ##