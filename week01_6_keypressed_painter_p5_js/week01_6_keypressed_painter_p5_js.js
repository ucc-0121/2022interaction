
function setup() {
    initializeFields();
    createCanvas(500, 500);
    background(color(0x5C, 0x8C, 0xCE));
    stroke(255, 0, 0);
}

function draw() {
    if (mouseIsPressed) {
        line(mouseX, mouseY, pmouseX, pmouseY);
    }
}

function keyPressed() {
    if (key == '1')
        stroke(color(0xD2, 0x58, 0xDB));
    if (key == '2')
        stroke(color(0x32, 0xBF, 0xB2));
    if (key == '3')
        stroke(color(0xE5, 0xCD, 0x43));
}

function initializeFields() {
}
