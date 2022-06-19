/*
  * Ordinals:
  *   st: first
  *   nd: second
  *   rd: third
  *   th: fourth, fifth, sixth, seventh, eigth, ninth, tenth, eleventh, twelfth, thirteenth, fourteenth, fifteenth
  *     sixteenth, seventeenth, eigtheenth, nineteenth, twentieth
  *
  *   1: st
  *   2: nd
  *   3: rd
  *   4-19: th
  *
*/

function century(year) {
  const century = String(getCentury(year));
  const centuryLastDigit = century[century.length - 1];
  const centuryLastTwoDigits = century.slice(century.length - 2);
  const ordinal = getOrdinal(centuryLastDigit, centuryLastTwoDigits);

  return console.log(century + ordinal);
}

function getCentury(year) {
  if (year % 100 === 0) {
    return year / 100;
  } else {
    return Math.floor((year / 100) + 1);
  }
}

function getOrdinal(centuryLastDigit, centuryLastTwoDigits) {
  switch (true) {
      case (centuryLastTwoDigits >= 10 && centuryLastTwoDigits <= 19):
        return 'th';
      case (centuryLastDigit >= 4 && centuryLastDigit <= 9):
        return 'th';
      case (centuryLastDigit === '0'):
        return 'th';
      case (centuryLastDigit === '1'):
        return 'st';
      case (centuryLastDigit === '2'):
        return 'nd';
      case (centuryLastDigit === '3'):
        return 'rd';
    }
}

century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
