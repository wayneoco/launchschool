function transactionsFor(id, transactions) {
  return transactions.filter(transaction => {
    return transaction.id === id;
  });
}

function isItemAvailable(id, transactions) {
  const itemTransactions = transactionsFor(id, transactions);
  let itemQuantity = 0;

  itemTransactions.forEach(transaction => {
    if (transaction.movement === 'in') {
      itemQuantity += transaction.quantity;
    } else {
      itemQuantity -= transaction.quantity;
    }
  });

  return itemQuantity > 0;
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(transactionsFor(101, transactions));
console.log(isItemAvailable(101, transactions));
console.log(isItemAvailable(105, transactions));
