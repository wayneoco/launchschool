function triangle(length) {
  let stars = 1;
  let spaces = length - stars;

  for (let line = 1; line <= length; ++line) {
    console.log(' '.repeat(spaces) + '*'.repeat(stars));
    stars += 1;
    spaces -= 1;
  }
}

triangle(5);
triangle(9);
triangle(20);
