let game;

function setup() {
    createCanvas(windowWidth, windowHeight);
    // 'Inter' er en skifttype fra Google Fonts som vi indlæser i index.html
    textFont('Inter');
    textSize(16);

    rectMode(CENTER);

    game = new Asteriodgame();
}

function draw() {
    background(220);
    game.run();
}

function keyPressed() {
    if (keyCode === 65) {
        game.player.x -= 5;
    }
    return false;
}

function keyReleased() {
    if (keyCode === 65) {
        game.player.x = game.player.x;
    }
    return false;
}

// function keyTyped() {
//     console.log(key);
// }