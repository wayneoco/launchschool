function wordCap(string) {
  return string.replace(/(?<!")\b[a-z]/g, match => match.toUpperCase());
}

console.log(wordCap('four score and seven'));       // "Four Score And Seven"
console.log(wordCap('the javaScript language'));    // "The Javascript Language"
console.log(wordCap('this is a "quoted" word'));    // 'This Is A "quoted" Word'
