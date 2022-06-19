/* eslint-disable */

/*
# PROBLEM
- input (2):
  - object
    - string keys
    - number values
  - integer
- output: string

- rules:
  - explicit:
    - create a function that returns the nearest chapter, given a page number as input
    - if the input page number is equidistant between two chapters, return the chapter with the higher page number
  - implicit:
    - property keys are chapter titles
    - values are numbers
    - page numbers are sorted from lowest to highest

- question / edge cases:
  - what if the input page number is negative?

# EXAMPLES / TEST CASES
- input page number is:
  - equal to a chapter page number
  - greater than the last chapter page number

# DATA STRUCTURES
- input: 
  - object
    - strings
    - numbers
- working with input:
  - array (in order to iterate over page numbers for comparison against input page number)
- output: string

# ALGORITHM
Approach:
- given an input book object of chapter titles and chapter page numbers, as well as an input page number, create a function that returns the title of the chapter that is nearest the input page number

Function (main):
ARGUMENTS: object, number

- initialize a variable to an array of the chapter titles of the input object
- initialize a variable to an array of the page numbers of the input object

- iterate over the array of page numbers:
  - for each iteration:
    - compare the current element and the next element with the input page number
    - if the current element is less than the input page number AND the next element is greater than the input page number:
      - the current element is the LOW band number, the next element is the HIGH band number
      - determine the distance from each number to the input number
      - if the low number is closer to the input number, return the corresponding title of the chapter for that page
      - if the high number is closer, return the title of the chapter for that page
      - if both the low and high numbers are equidistant from the input page number, return the chapter title of the high number
      - the corresponding chapter title is at the same index as the page number

- RETURN: string (chapter title)

*/

/* eslint-enable */

function nearestChapter(book, page) {
  const chapters = Object.keys(book);
  const pages = Object.values(book);
  let index;
  let currentPage;
  let nextPage;

  for (index = 0; index < pages.length; index += 1) {
    currentPage = pages[index];
    nextPage = pages[index + 1];

    if ((currentPage <= page && nextPage >= page) || page > nextPage) {
      break;
    }
  }

  if (page - currentPage < nextPage - page) {
    return console.log(chapters[index]);
  } else if (page - currentPage >= nextPage - page) {
    return console.log(chapters[index + 1]);
  } else if (page > nextPage) {
    return console.log(chapters[index + 1]);
  }
}

nearestChapter({
  "Chapter 1" : 1,
  "Chapter 2" : 15,
  "Chapter 3" : 37
}, 10); // ➞ "Chapter 2"


nearestChapter({
  "New Beginnings" : 1,
  "Strange Developments" : 62,
  "The End?" : 194,
  "The True Ending" : 460
}, 200); // ➞ "The End?"


nearestChapter({
  "Chapter 1a" : 1,
  "Chapter 1b" : 5
}, 3); // ➞ "Chapter 1b"

nearestChapter({
  'Chapter 1': 1,
  'Chapter 2': 10,
  'Chapter 3': 15,
}, 10); // -> 'Chapter 2'

nearestChapter({
  'Chapter 1': 1,
  'Chapter 2': 10,
}, 20); // -> 'Chapter 2'
