function setup() {
    initializeFields();
    createCanvas(500, 500);
}

function draw() {
    background(color(0xFF, 0xE5, 0x4D));
    fill(color(0x6A, 0x91, 0xC6));
    rect(100, 100, 100, 100);
    rect(mouseX, mouseY, 100, 100);
}
function initializeFields() {
}
