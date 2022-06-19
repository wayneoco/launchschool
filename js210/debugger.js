function hello(name) {
  console.log('Hello, ' + name + '!');
}

function greetEveryone() {
  var names = ["Darlene", "Sam", "Prasad", "Ming"];

  for (var i = 0; i < names.length; i++) {
    var name = names[i];
    hello(name);
  }
}

greetEveryone();
