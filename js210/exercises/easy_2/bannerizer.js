function logInBox(string, width) {
  if (width === undefined) {
    width = string.length + 2;
  }

  string = string.slice(0, width + 1);
  const interiorWidth = string.length + 2;
  const horizontalDashes = '-'.repeat(interiorWidth);
  const spaces = ' '.repeat(interiorWidth);
  const lineWithDashes = `+${horizontalDashes}+`;
  const lineWithSpaces = `|${spaces}|`;
  const lineWithString = `| ${string} |`;

  console.log(lineWithDashes);
  console.log(lineWithSpaces);
  console.log(lineWithString);
  console.log(lineWithSpaces);
  console.log(lineWithDashes);
}

function stringSizeCheck(string, width) {
  if (string.length > width) {
    return string.slice(0, width)
  }
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
