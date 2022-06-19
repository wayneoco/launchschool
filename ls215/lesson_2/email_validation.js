function isValidEmail(email) {
  if (email.indexOf('@') !== email.lastIndexOf('@')) return false;

  let [ local, domain ] = email.split('@');
  let localRegex = /^[0-9a-z]+$/i;
  let domainRegex = /^[a-z]+\.[a-z]+(\.[a-z]*\.?)*$/i;

  return localRegex.test(local) && domainRegex.test(domain);
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false
