const MINUTES_PER_HOUR = 60;
const HOURS_PER_DAY = 24;
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

function afterMidnight(time) {
  const date = new Date(`1/1/2000 ${time}`);
  const hours = date.getHours();
  const minutes = date.getMinutes
  const totalMinutes = minutes + (hours * MINUTES_PER_HOUR);

  return totalMinutes;
}

function beforeMidnight(time) {
  const minutesAfterMidnight = afterMidnight(time);
  const minutesBeforeMidnight = time === '00:00' ? 0 : MINUTES_PER_DAY - minutesAfterMidnight;

  return minutesBeforeMidnight;
}

console.log(afterMidnight('00:00'));       // 0
console.log(beforeMidnight('00:00'));      // 0
console.log(afterMidnight('12:34'));       // 754
console.log(beforeMidnight('12:34'));      // 686
