function makeBank() {
  let accountsRegistry = [];
  return {
    openAccount() {
      let number = accountsRegistry.length + 101;
      let account = makeAccount(number);
      accountsRegistry.push(account);
      return account;
    },
    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  };
}

function makeAccount(number) {
  let balance = 0;
  let transactions = [];
  return {
    balance() {
      return balance;
    },
    deposit(amount) {
      balance += amount;
      transactions.push({ type: 'deposit', amount: amount });
      return amount;
    },
    withdraw(amount) {
      if (amount > balance) {
        amount = balance;
      }

      balance -= amount;
      transactions.push({ type: 'withdraw', amount: amount });
      return amount;
    },
    transactions() {
      return transactions;
    },
    number() {
      return number;
    },
  };
}

let bank = makeBank();
let source = bank.openAccount();
source.deposit(10);

let destination = bank.openAccount();
bank.transfer(source, destination, 7);
console.log(source.balance());
console.log(source.transactions());
console.log(source.number());

console.log(bank.accounts);
