let game;

function setup() {
    createCanvas(windowWidth, windowHeight);
    // 'Inter' er en skifttype fra Google Fonts som vi indlæser i index.html
    textFont('Inter');
    textSize(16);

    game = new Asteriodgame();
}

function draw() {
    background(220);
}