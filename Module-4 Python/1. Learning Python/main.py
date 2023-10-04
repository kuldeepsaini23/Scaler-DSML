# print("Hello World")


#* Valid identifiers 
age = 24
name = "anuj"
last_name = "kumar"
_id = "underscore"
name2 = "anuj" 

#* invalid identifiers 
# 2name = "anuj"
# name@ = "anuj"
# name-2 = "anuj"
# class = "anuj" #* class is a keyword in python

# print (age)
# print (name)

#* Data Types
rating = 4.7 # float
is_published = True # boolean
name = "anuj" # string
marks = 24 # int
my_complexNumber = 2 + 3j # complex number
fruit_list = ["apple", "banana", "cherry"] # list
# print("Fruit_list Data Type: ",type(fruit_list))

#! Python Operators
# a = 20
# b = 10
#* Arithmetic Operators
# c = a+b
# print("Addition: ",c)
# c = a-b
# print("Subtraction: ",c)
# c = a*b
# print("Multiplication: ",c)
# c = a/b
# print("Division: ",c)
# c = a%b
# print("Modulus: ",c)
# c = a**b
# print("Exponentiation: ",c)
# c = a//b
# print("Floor Division: ",c)

#* Assignment Operators
# c = a+b
# print("Addition: ",c)
# c += a
# print("Addition: ",c)
# c -= a
# print("Subtraction: ",c)
# c *= a
# print("Multiplication: ",c)
# c /= a
# print("Division: ",c)
# c %= a
# print("Modulus: ",c)
# c **= a
# print("Exponentiation: ",c)
# c //= a
# print("Floor Division: ",c)

#* Comparison Operators
a = 20
b = 10
# c = a==b
# print("Equal: ",c)
# c = a!=b
# print("Not Equal: ",c)
# c = a>b
# print("Greater Than: ",c)
# c = a<b
# print("Less Than: ",c)
# c = a>=b
# print("Greater Than or Equal: ",c)
# c = a<=b
# print("Less Than or Equal: ",c)


#* Logical Operators
# a = True
# b = False
# c = a and b
# print("AND: ",c)
# c = a or b
# print("OR: ",c)
# c = not a
# print("NOT: ",c)

#!Input
# name = input("Enter your name: ") 
# print("Hello "+name)

#! Type Conversion  
# a = int(name)
# print(a, "heelo")

#! if else
# a = 20
# b = 10
# if a>b:
#     print("a is greater than b")
# elif a==b:
#     print("a is equal to b")

#! Range
# a = range(10);
# print(a)
# b = list(range(1,10,2))
# print(b)


#! For Loop
# for i in range(10):
#     print(i)

# a = ["apple", "banana", "cherry"]
# for i in a:
#     print(2*i, end=" ")

#! While Loop
# i = 5
# while i>=0:
#     print(i)
#     i-=1

#! Break and Continue
# for i in range(10):
#     if i==7:
#         break
#     if i==5:
#         continue
#     print(i)

#! String
# a = "Hello World"
# print(a)
# b = 'Hello World'
# print(b)
# c = """Hello 
# World"""
# print(c)

# print(a[0])

#* String Slicing
# print(a[0:5])
# print(a[0:])
# print(a[:5])
# print(a[-5:-1])
# print(a[0:5:2])

#* String Concatenation
# a = "Hello"
# b = "World"
# c = a + " " + b 
# print(c)


#* String Methods
# print(len(a))
# print(a.strip())
# print(a.lstrip())
# print(a.rstrip())

# print(a.lower())
# print(a.upper())
# print(a.replace("H", "J"))
# print(a.split(" "))
# print(a.find("W"))
# print(a.count("l"))
# print(a.isalpha())
# print(a.isalnum())
# print(a.isdigit())
# print(a.islower())
# print(a.isupper())
# print(a.isspace())
# print(a.startswith("H"))
# print(a.endswith("d"))
# print(a.index("W"))
# print(a.rindex("W"))
# print(a.join("123"))
# print(a.capitalize())

#* String Formatting
# age = 24
# name = "anuj"
# print("Hello "+name+" your age is "+str(age))

# print("Hello {} your age is {}".format(name, age))

# #* Print String using loop
# name = "Kuldeep Saini"
# for i in name:
#     print(i, end=" ")


#! List
# a = ["apple", "banana", "cherry"]
# print(a)
# print(a[0])
# a[0] = "mango"
# print(a)

# #* List Slicing
# print(a[0:2])
# print(a[0:])
# print(a[:2])
# print(a[-2:-1])
# print(a[0:2:2])
# del a
# print(a)

#* Input in List
# a = [x for x in range(100) if x%2 ==0]
# print(a)

#* List Methods
# a = ["apple", "banana", "cherry"]
# a.append("mango")
# print(a)
# a.insert(1, "orange")
# print(a)
# a.remove("banana")
# print(a)
a = [2,2,0,1,2,3,4]
# a.sort()
# print(a)
# a.reverse()
# print(a)
# a.pop()
# a.pop(2) #* remove element at index 2
# print(a)
# a.clear() 
# print(a)
# print(a.index(2)) #* return the index of first occurence of 2
# print(a.count(2)) #* return the number of occurence of 2

#* List Comprehension
# a = [x for x in range(100) if x%2 ==0]
# print(a)

#* List Functions
a = [2,2,0,1,2,3,4]
# print(len(a))
# print(max(a))
# print(min(a))
# print(sum(a))
# print(sorted(a))
# print(reversed(a))  #* return a reverse iterator
# print(list(reversed(a))) #* return a reverse list
#* Sequence to list
# print(list("Hello World"))
# a = range(10)
# b = list(a)
# print(b)
#* for loop in list
# for i in b:
#     print(i, end=" ")

#! Tuple(Same as list but immutable)
# a = ("apple", "banana", "cherry")
# print(a)
# a[0] = "mango" --> Give Error because tuple is immutable

#! Set
# a = {1,2,2,3,4,5}
# print(a)
# print(a[0]) --> Give Error because set is unordered
# a[0] = 10 --> Give Error because set is unordered

#* Set Methods
# a = {1,2,2,3,4,5}
# a.add(6)
# print(a)
# a.remove(2)
# print(a)

#! Dictionary
a = {
  "name": "anuj",
  "age": 24,
  "marks": [1,2,3,4,5]
}
# print(a)
# print(a["name"])
# print(a.get("name"))
#* Updating Dictionary

# a["name"] = "kuldeep"
# print(a)
# print(a["marks"])

#* Adding new key value pair
# a["is_verified"] = True
# print(a)

#*Print Dictionary
# for i in a:
#     print(a[i])

#* Pop and isnerting
# a["first_name"] = a.pop("name")
# print(a)

#! Dictionary Methods
# print(a.keys())
# print(a.values())
# print(a.items())
# print(a.popitem())
# print(a.clear())

#! Functions
#* math Module
# import math as m
# print(m.sqrt(4))
# from math import sqrt
# print(sqrt(4))

#* User Defined Function
# def greet():
#     print("Hello")
# greet()

# def greet(name):
#     print("Hello "+name)
# greet("Kuldeep")

#* Parameter Function
# def greet(name, dish="Maggie"):
#     print("Hello "+name)
#     print("Your favourite dish is "+dish)
# greet("Kuldeep", "pasta")
# greet("Kuldeep")

#* Returning from the function
# def add(a,b):
#   return a+b
# print(add(2,3))

# def sumOfList(a):
#   return sum(a)

# list = [1,2,3,4,5]
# print(sumOfList(list))

def greeting(names):
  for name in names:
    print("Hello "+name)

names = ["anuj", "kuldeep", "saini"]
greeting(names)


