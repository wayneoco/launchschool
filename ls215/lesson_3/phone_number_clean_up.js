/* eslint-disable */

/* ### Problem Description ###
 * Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.
 * Other than digits, the number may also contain special characters such as spaces, dash, dot, and parentheses that should be ignored.
 *
 * Rules:
 * - If the phone number is less than 10 digits, assume that it is a bad number.
 * - If the phone number is 10 digits, assume that it is good.
 * - If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits.
 * - If the phone number is 11 digits and the first number is not 1, then it is a bad number.
 * - If the phone number is more than 11 digits, assume that it is a bad number.
 * - For bad numbers, return a string of 10 0s.
 *
 * ### Problem ###
 * - input: a string
 * - output:
 *    - when input is valid: 10-digit string
 *    - when input is invalid: string of 10 0s
 * - rules:
 *   - explicit:
 *    - valid input number:
 *      - must contain 10 or 11 digits (read: digits, not total characters)
 *      - may also contain special characters:
 *       - space
 *       - dash
 *        - dot
 *        - parentheses
 *      - if 11 digits, first digit must be a 1
 * - questions:
 *   - what about double special characters, e.g., two spaces in a row, or two dashes in a row?
 *   - what about an empty string?
 *   - what about no input at all?
 *   - what if the input begins with a special character?
 *
 * ### Data Structures
 * - input:
 *   - string
 *   - split into array (no delimiter in order to capture every character)
 * - output: 
 *   - string
 *
 * ### Algorithm ###
 * Approach: create a function that takes a string as input, removes non-digit characters and a returns a 10 character string of only digits. Return a string of 10 0s if the input is invalid.
 *
 * Function:
 * - validate input and return a string of 10 0s if invalid
 *   - valid input:
 *    - contains only digits and/or allowed special characters:
 *      - space
 *      - dash
 *      - dot
 *      - parentheses
 * - split valid input string into an array of characters
 *   - no delimeter because the input string may contain a combination of special characters
 * - iterate over the array of characters, selecting only characters that are digits 0-9
 * - join the array
 * - if length of phone number is 11 AND the first number is 1, remove the 1
 * - return phone number
 *
 */


/* eslint-enable */

function cleanPhoneNumber(string) {
  let phoneNumber = string.replace(/\D/g, '');

  if (isInvalidInput(phoneNumber)) return '0000000000';

  if (phoneNumber.length === 11 && phoneNumber[0] === '1') {
    phoneNumber = phoneNumber.slice(1);
  }

  return phoneNumber;
}

function isInvalidInput(string) {
  const stringLength = string.length;

  return (stringLength < 10 || stringLength > 11) ||
    (stringLength === 11 && string[0] !== '1');
}

console.log(cleanPhoneNumber(''));                    // '0000000000'
console.log(cleanPhoneNumber('111'));                 // '0000000000'
console.log(cleanPhoneNumber('-----'));               // '0000000000'
console.log(cleanPhoneNumber('22222222222'));         // '0000000000'
console.log(cleanPhoneNumber('333333333333'));        // '0000000000'
console.log(cleanPhoneNumber('  11--- 111  ::abc'));  // '0000000000'
console.log(cleanPhoneNumber('1234567890'));          // '1234567890'
console.log(cleanPhoneNumber('  1 2 222222222----')); // '2222222222'
console.log(cleanPhoneNumber('  2 2 222222222----')); // '0000000000'
console.log(cleanPhoneNumber('15551234567'));         // '5551234567'
console.log(cleanPhoneNumber('1-555-123-4567'));      // '5551234567'
console.log(cleanPhoneNumber('1 555 123 4567'));      // '5551234567'
console.log(cleanPhoneNumber('1 (555) 123-4567'));    // '5551234567'
console.log(cleanPhoneNumber('(555) 123-4567'));      // '5551234567'
console.log(cleanPhoneNumber('1.555.123.4567'));      // '5551234567'
console.log(cleanPhoneNumber('1--555   123 (4567)')); // '5551234567'

