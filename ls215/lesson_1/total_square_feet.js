const calculateSquareArea = rectangle => rectangle[0] * rectangle[1];

const totalArea = function (rectangles) {
  const squareAreas = rectangles.map(calculateSquareArea);

  return squareAreas.reduce((sum, area) => sum + area);
};

const totalSquareArea = function (rectangles) {
  const squares = rectangles.filter(rectangle => rectangle[0] === rectangle[1]);

  return totalArea(squares);
};

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
console.log('Rectangles: ' + totalArea(rectangles));

rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
console.log('Squares: ' + totalSquareArea(rectangles));    // 121
