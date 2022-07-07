'use strict';

class Game {
  static wordCount;
  static maxAllowedGuesses = 6;
  static messages = {
    outOfWords: 'Sorry, I\'ve run out of words!',
    win: 'You win!',
    lose: 'Sorry, you\'re out of guesses!',
    playAgain: 'Play again',
  }
  static randomWord = (() => {
    const words = ['orange', 'pear', 'apple', 'banana'];
    return function() {
      const index = Math.floor(Math.random() * words.length);
      const word = words.splice(index, 1)[0];
      this.wordCount = words.length;
      return word;
    };
  })();

  constructor() {
    this.wordLetters = this.constructor.randomWord().split('');
    this.guessCount = 0;
    this.guessedLetters = [];

    if (this.wordLetters[0]) {
      this.remainingCharsToWin = this.wordLetters.length;
    }

    this.body = document.querySelector('body');
    this.spaces = document.querySelector('#spaces');
    this.spacesHeading = this.spaces.querySelector('h2');
    this.guesses = document.querySelector('#guesses');
    this.guessesHeading = this.guesses.querySelector('h2');
    this.apples = document.querySelector('#apples');
    this.message = document.querySelector('#message');
    this.playAgainLink = document.querySelector('#play-again a');
    this.generateWordBlanks();
  }

  generateWordBlanks() {
    const numberOfBlanks = this.wordLetters.length;

    for (let index = 0; index < numberOfBlanks; index += 1) {
      const letterBlank = document.createElement('span');
      letterBlank.setAttribute('id', `${index}`);

      this.spaces.appendChild(letterBlank);
    }
  }

  displayMatchedLetter(letter) {
    const self = this;
    const matchedIds = Object.keys(this.wordLetters).filter(key => {
      return self.wordLetters[key] === letter;
    });

    matchedIds.forEach(id => {
      const space = document.getElementById(`${id}`);
      space.textContent = letter;
    });
  }

  displayGuessedLetter(letter) {
    const space = document.createElement('span');
    space.textContent = letter;
    this.guesses.appendChild(space);
  }

  updateAppleGuessClass() {
    this.apples.className = `guess_${this.guessCount}`;
  }

  checkGameResult() {
    if (this.remainingCharsToWin === 0) {
      this.message.textContent = this.constructor.messages.win;
      this.body.className = 'win';
    } else if (this.guessCount === this.constructor.maxAllowedGuesses) {
      this.message.textContent = this.constructor.messages.lose;
      this.body.className = 'lose';
    } else {
      return;
    }

    this.playAgainLink.textContent = Game.messages.playAgain;
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let game;

  const newGame = () => {
    game = new Game();
    addEventHandlers();
  };

  const handleKeyupEvent = (e) => {
    e.preventDefault();
    const letter = e.key;

    // if a non-alphabetic key is pressed, or the body element has a win or lose class
    // (i.e, the game is over), don't execute the rest of the event handler.
    // this prevents the guess row from continuing to populate with additional keypresses.
    if (!/^[a-z]$/i.test(letter) || game.body.className) return;

    // if a key matches a letter in the target word, and the key hasn't already been pressed,
    // display the matched letter and decrement the count of remaining characters needed to win
    if (game.wordLetters.includes(letter) && !game.guessedLetters.includes(letter)) {
      const letterMatchCount = game.wordLetters.filter(char => char === letter).length;
      game.displayMatchedLetter(letter);
      game.remainingCharsToWin -= letterMatchCount;
    }

    // if a key hasn't already been guessed, display the letter in the guess row, track the letter,
    // increment the guess count and update the apples guess class
    if (!game.guessedLetters.includes(letter)) {
      game.displayGuessedLetter(letter);
      game.guessedLetters.push(letter);
      game.updateAppleGuessClass();
      game.guessCount += 1;
    }

    game.checkGameResult();
  };

  const handlePlayAgainClickEvent = (e) => {
    e.preventDefault();
    e.stopPropagation();
    resetGame();
  };

  const addEventHandlers = () => {
    document.addEventListener('keyup', handleKeyupEvent);
    game.playAgainLink.addEventListener('click', handlePlayAgainClickEvent);
  };

  const removeEventHandlers = () => {
    document.removeEventListener('keyup', handleKeyupEvent);
    game.playAgainLink.removeEventListener('click', handlePlayAgainClickEvent);
  };

  const resetGame = () => {
    if (Game.wordCount === 0) {
      game.message.textContent = Game.messages.outOfWords;
      game.playAgainLink.replaceChildren();
      removeEventHandlers();
      return;
    }

    // remove child nodes for letter spaces from previous game
    while (game.spaces.lastChild !== game.spacesHeading) {
      game.spaces.removeChild(game.spaces.lastChild);
    }

    // remove child nodes for guessed letters from previous game
    while (game.guesses.lastChild !== game.guessesHeading) {
      game.guesses.removeChild(game.guesses.lastChild);
    }

    // remove game message
    game.message.replaceChildren();

    // remove play again link
    game.playAgainLink.replaceChildren();

    // reset background
    game.body.className = '';

    removeEventHandlers();
    newGame();
  };

  newGame();
});
