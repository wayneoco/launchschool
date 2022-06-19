function randomAge(name, min, max) {
  const age = Math.floor((Math.random() * (max - min)) + min);
  console.log(`${name} is ${age} years old!`);
}

randomAge('Teddy', 20, 200);
