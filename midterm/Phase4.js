const canv = 1400;
const grid = 10;

const ogw = 140;
const ogh = 103;
const canvw = canv;
const canvh = canv * (103 / 140);
const nw = canv / grid;
const nh = canvh / grid;

function setup() {
  createCanvas(canvw, canvh);
  noStroke();
}

function drawObject(x, y, s) {
  push();
  translate(x, y);
  scale(s);
  
  fill(0);
  circle(10, 10, 20);
  arc(80, 10, 20, 20, 4.71239, 5.84685);
  circle(36.2, 82, 13);
  circle(132.85, 96, 14)
  circle(59.4, 57.4, 20)
  circle(35, 10, 20)
  
  
  fill(0);
  quad(10, 0, 42, 0, 35, 20, 10, 20); 
  quad(40, 0, 80, 0, 80, 10, 40, 10);
  quad(55, 10, 90, 10, 90, 20, 55, 20);
  quad(60, 20, 70, 20, 40, 80, 30, 80);
  quad(89, 6, 139.66, 94, 129.2, 94, 77, 7);
  quad(80, 40, 98, 40, 137, 99, 126.2, 99);
  quad(41.45, 85.5, 80, 40, 60, 40, 30, 83);
  quad(50, 60, 60, 60, 65, 65, 50, 75);
  quad(65, 15, 90, 15, 97, 40, 55, 41)
  quad(38, 10, 51, 10, 51.5, 10, 40, 19)
  
  fill(255);
  circle(75.7, 47, 16);
  circle(61.6, 78.5, 22);
  circle(53.5, 17, 14)
  quad(67.7, 47, 70, 47, 70, 57, 69, 62)
  
  pop();
}

function draw() {
  for (let yc = 0; yc <= grid - 1; yc++) {
    for (let xc = 0; xc <= grid - 1; xc++) {
      drawObject(xc * nw, yc * nh, nw/ogw);
    }
  }
}

console.log("Canvas width =", canvw);
console.log("Canvas height =", canvh);
console.log("Grid width =", nw);
console.log("Grid height =", nh);