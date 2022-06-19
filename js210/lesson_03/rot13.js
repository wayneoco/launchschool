function rot13(string) {
  let chars = string.split('');

  chars = chars.map(char => {
    if (/[^a-zA-Z]/.test(char)) return char;

    return encryptChar(char);
  });

  return chars.join('');
}

function encryptChar(char) {
  const ROTATION_FACTOR = 13;
  let charCode = char.charCodeAt();

  if (ifAddRotationFactor(charCode)) {
    return String.fromCharCode(charCode + ROTATION_FACTOR);
  } else {
    return String.fromCharCode(charCode - ROTATION_FACTOR);
  }
}

function ifAddRotationFactor(charCode) {
  const UPPER_A_CODE = 65;
  const UPPER_M_CODE = 77;
  const LOWER_A_CODE = 97;
  const LOWER_M_CODE = 109;

  return (charCode >= UPPER_A_CODE && charCode <= UPPER_M_CODE) || 
    (charCode >= LOWER_A_CODE && charCode <= LOWER_M_CODE)
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

