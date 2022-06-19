/* eslint-disable */

/*
### Problem Description ###
The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!

Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').

### Problem ###
- input:
  - string
    - (1) input text
    - (2) keyword
- output:
  - string
- rules:
  - explicit:
    - each letter of the keyword is a shift value based on its index value in the alphabet
    - each letter of the input text is encrypted using a Ceasar Cipher
      - the keyword is used to sequentially determine the Ceasar Cipher key for each letter
    - non-letters are left as-is

### Data Structures ###
- input:
  - string (for input text)
  - string (for keyword)
- working with input:
  - array (for keyword ceasar cipher values)
- output:
  - string

### Algorithm ###
- concatenate keyword to itself n times, where n =
  - input string length / keyword length (rounded up)
- split repeated keyword into an array of characters
  - transform array using the value of each character's position in the alphabet

- iterate over the input string, transforming the each character as follows:
  - non-letter characters remain as-is
  - for each letter character:
    - determine ceasar cipher letter using the index of the current letter to determine the ceasar cipher key from the array of keys created earlier
    - invoke ceasar encrypt function

*/

/* eslint-enable */

const LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function vigenereEncrypt(string, keyword) {
  let keywordValues = keyword.toUpperCase()
                             .repeat(Math.ceil(string.length / keyword.length))
                             .split('')
                             .map(letter => LETTERS.indexOf(letter));
  let keyIndex = 0;
  let encryptedText = string.split('').map(char => {
    if (/[^a-z]/i.test(char)) return char;

    let key = keywordValues[keyIndex];
    keyIndex += 1;

    return caesarEncrypt(char, key);
  });

  return encryptedText.join('');
}

function caesarEncrypt(char, key) {
  let index = LETTERS.indexOf(char.toUpperCase());
  let newIndex = index + key;
  newIndex = newIndex > 25 ? normalizeIndex(newIndex) : newIndex;

  let encryptedLetter = LETTERS[newIndex];

  return /[a-z]/.test(char) ? encryptedLetter.toLowerCase() : encryptedLetter;
}

function normalizeIndex(index) {
  while (index > 25) {
    index -= 26;
  }

  return index;
}

console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'meat'));
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'A'));
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'Aa'));
console.log(vigenereEncrypt("Pineapples don't go on pizzas!", 'cab'));
console.log(vigenereEncrypt("Dog", 'Rabbit'));
