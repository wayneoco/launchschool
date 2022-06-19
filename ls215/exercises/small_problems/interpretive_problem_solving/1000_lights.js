/* eslint-disable */

/*
 
### Problem Description ###
You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

### Problem ###
- input: integer
- output: array (of integers)
- rules:
  - explicit: 
    - input integer represents:
      - a row of switches numbered 1 to n
      - the number of rounds of toggling the switches
    - initial position of every switch is OFF (0)
    - each round traverses the entire length of the row of switches
    - each round starts at the beginning of the row
    - toggling rules:
      - first round: every swtich
      - second round: every 2nd switch
      - third round: every 3rd switch
      - fourth round: every 4th switch
      ...
    - at the end of the n rounds, return an array of the switches in the ON position
- questions:
  - input 0?
  - no input?
  - fractional input?
  - negative input?
  - string digit?

### Data Structures ###
- input: integer
- working with input: array
- output: array (of integers)

### Algorithm ###

- input = n
- create an array of n length, with each element as `false`
- iterate over the array n times:
  - starting round r is 1
  - for each iteration:
    - toggle each element's value if its index + 1 is a multiple of r(ound)
- once the array is in its final state, filter the array to have elements whose value is true
- return the resulting array


/* eslint-enable */

const INDEX_ADJUSTMENT = 1;

function lightsOn(switches) {
  let lights = Array(switches).fill(true);
  lights = toggleLights(lights);

  let lightIDS = Object.keys(lights)
                       .filter(id => lights[id]);

  return lightIDS.map(id => Number(id) + INDEX_ADJUSTMENT);
}

function toggleLights(lights) {
  for (let round = 2; round <= lights.length; round += 1) {
    lights = lights.map((light, index) => {
      if ((index + INDEX_ADJUSTMENT) % round === 0) {
        return !light;
      } else {
        return light;
      }
    });
  }
  return lights;
}

console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
