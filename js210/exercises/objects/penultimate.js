function penultimate(string) {
  const words = string.split(' ');
  return words[words.length - 2];
}

penultimate('last word');                    // expected: "last"
penultimate('Launch School is great!');      // expected: "is"
