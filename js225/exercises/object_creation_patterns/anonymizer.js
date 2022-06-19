let Account = (function() {
  const NUMBER_OF_CHARS = 62;
  const DISPLAY_NAME_SIZE = 16;
  const privateData = new Map();

  function isValidPassword(func, ...args) {
    const enteredPassword = args[0];

    if (enteredPassword === privateData.get(this).password) {
      return func(...args);
    } else {
      return 'Invalid Password';
    }
  }

  function getRandomLetterNumber() {
    let randomIndex = Math.floor(Math.random() * NUMBER_OF_CHARS);
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'[randomIndex];
  }

  function anonymize() {
    let result = '';

    for (let i = 1; i <= DISPLAY_NAME_SIZE; i += 1) {
      result += getRandomLetterNumber();
    }

    return result;
  }

  return {
    init(email, password, firstName, lastName) {
      privateData.set(this, {
        email,
        password,
        firstName,
        lastName,
      });
      this.displayName = anonymize();
      return this;
    },

    reanonymize(password) {
      const func = function() {
        this.displayName = anonymize();
        return true;
      }.bind(this);

      return isValidPassword.call(this, func, password);
    },

    resetPassword(enteredPassword, newPassword) {
      const func = function(...args) {
        let newPassword = args[args.length - 1];
        privateData.get(this).password = newPassword;
        return true;
      }.bind(this);

      return isValidPassword.call(this, func, enteredPassword, newPassword);
    },

    firstName(password) {
      const func = function() {
        return privateData.get(this).firstName;
      }.bind(this);

      return isValidPassword.call(this, func, password);
    },

    lastName(password) {
      const func = function() {
        return privateData.get(this).lastName;
      }.bind(this);

      return isValidPassword.call(this, func, password);
    },

    email(password) {
      const func = function() {
        return privateData.get(this).email;
      }.bind(this);

      return isValidPassword.call(this, func, password);
    },
  };
})();

let fooBar = Object.create(Account).init('foo@bar.com', '123456', 'foo', 'bar');
console.log(fooBar.firstName);                     // returns the firstName function
console.log(fooBar.email);                         // returns the email function
console.log(fooBar.firstName('123456'));           // logs 'foo'
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.displayName);                   // logs 16 character sequence
console.log(fooBar.resetPassword('123', 'abc'))    // logs 'Invalid Password'
console.log(fooBar.resetPassword('123456', 'abc')) // logs true

let displayName = fooBar.displayName;
console.log(fooBar.reanonymize('abc'));                         // returns true
console.log(displayName === fooBar.displayName);   // logs false

let bazQux = Object.create(Account).init('baz@qux.com', '123456', 'baz', 'qux');
console.log(fooBar.firstName('abc'));              // logs 'Invalid Password'
console.log(fooBar.email('abc'));                  // logs 'Invalid Password'
console.log(bazQux.firstName('123456'));
console.log(bazQux.email('123456'));
