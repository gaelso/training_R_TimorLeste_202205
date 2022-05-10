
## Training on National Forest Inventory: Overview and data analysis for carbon 
## 09-13/05/2022, Dili, Timor Leste
## Gael Sola (FAO)



## --- Vectors --------------------------------------------------------------

vec <- c(1, 4, 5.8)
vec

vec1 <- c("a", "b", "c")
vec1

vec2 <- 2 * (1:10)
vec2


## Data can be selected inside a vector
vec2[3]

## Data can be replaced
vec2[3] <- 1000
vec2


## +++ EX 4 +++
## 1. Create a vector called my_vec containing the values 2, 36, 72
## 2. Replace the 3rd value with 12
## 3. Create a vector my_vec2 containing the multiples of 3 from 6 to 27.
## 4. Replace the 4th value by 24
## 5. Replace the 5th value by the text "work?". Does it work?
## +++



## --- Lists ----------------------------------------------------------------

## Example of list
list1 <- list(a = 1:10, 
              b = c("a","b","c"), 
              c = matrix(1:100, nrow=10, byrow=T)
)

## Elements of the list can be selected by 2 methods square brackets [] or Dollar sign $
list1
list1[1]
list1[[1]]
list1$a

### Other example
list_nfi <- list(
  dbh = c(5,10,40,55,65), 
  height = c(23, 25, 26, 35, 40), 
  fao_biome = c("Tropical rainforest", "Tropical rainforest", "Tropical rainforest", "Tropical moist deciduous","Tropical moist deciduous")
)

list_nfi

list_nfi[1]
list_nfi[[1]]
list_nfi$dbh


## +++ EX 5 +++
## 1. Create  list containing 5 objects, including at least one vector and one text, 
## 2. Extract the first value of the first vector.
## +++



## END ##