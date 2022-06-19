function swapName(name) {
  let [...firstName, lastName] = name.split(' ');

  return `${lastName}, ${firstName}`;
}

console.log(swapName('Joe Roberts'));    // "Roberts, Joe"
