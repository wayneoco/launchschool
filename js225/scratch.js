let box = {
  x: 25,
  y: 42,
  z: 12,
  logVolume() {
    const volume = this.x * this.y * this.z;
    console.log(volume);
  },
};

let box2 = {
  x: 30,
  y: 10,
  z: 15,
  logVolume: box.logVolume,
}

// OR you can put new code here.

box2.logVolume();     // logs 4500
