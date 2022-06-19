let rlSync = require('readline-sync');
let length = rlSync.question('Enter the length of the room in meters: ');
length = parseInt(length, 10);
let width = rlSync.question('Enter the width of the room in meters: ');
width = parseInt(width, 10);

const METERS_TO_FEET = 10.7639;

let areaMeters = (width * length).toFixed(2);
let areaFeet = (areaMeters * METERS_TO_FEET).toFixed(2);

console.log(`The area of the room is ${areaMeters} square meters (${areaFeet} square feet).`);
