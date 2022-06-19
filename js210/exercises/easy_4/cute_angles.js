const DEGREE = "\xB0";
const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;

function dms(angle) {
  if (angle < 0) {
    angle = convertNegativeAngle(angle);
  }

  const degrees = formatNumber(Math.floor(angle));
  const hours = Math.floor((angle - degrees) * MINUTES_PER_DEGREE);
  const minutes = Math.floor(
    (angle % 1) * MINUTES_PER_DEGREE % 1 * SECONDS_PER_MINUTE
  );

  return `${formatNumber(degrees)}${DEGREE}${formatNumber(hours)}'${formatNumber(minutes)}"`;
}

function convertNegativeAngle(number) {
  while (number < 0) {
    number = 360 + number;
  }

  return number;
}

function formatNumber(number) {
  number = String(number);

  if (number.length < 2) {
    return `0${number}`;
  } else {
    return `${number}`;
  }
}

console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"
console.log(dms(-1));
console.log(dms(-40));
console.log(dms(-420));
