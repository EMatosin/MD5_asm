# MD5_asm

###### *https://www.simplilearn.com/tutorials/cyber-security-tutorial/md5-algorithm*

## Steps in MD5 Algorithm

There are four major sections of the algorithm:

### Padding Bits

When you receive the input string, you have to make sure the size is 64 bits short of a multiple of 512. When it comes to padding the bits, you must add one(1) first, followed by zeroes to round out the extra characters. 

--> Comme on controle dans un premier temps la chaîne de caractère en entrée, on peut essayer de mettre une chaîne de caractère en entrée d'une taille de 448 bits, on évite ainsi à devoir coder le padding.

### Padding Lenght

You need to add a few more characters to make your final string a multiple of 512. To do so, take the length of the initial input and express it in the form of 64 bits. On combining the two, the final string is ready to be hashed.

--> Avec une chaine de caractère, il faut donc rajouter 448 en format 64bits, soit 111000 (58 zéros avant en plus)

### Initialize MD Buffer

The entire string is converted into multiple blocks of 512 bits each. You also need to initialize four different buffers, namely A, B, C, and D. These buffers are 32 bits each and are initialized as follows:

- A = 01 23 45 67

- B = 89 ab cd ef

- C = fe dc ba 98

- D = 76 54 32 10

