class Player extends Component {
    constructor() {
        super();
        this.x = windowWidth / 2;
        this.y = windowHeight / 2;
        this.h = 50;
        this.w = 50;
    }

    display() {
        fill(255);
        circle(this.x, this.y, this.w);
        this.aim();
    }

    update() {
        this.move();
    }

    aim() {
        line(this.x, this.y, mouseX, mouseY);
    }

    move() {
        // this.keyTyped();
        // this.keyPressed();
        // this.keyReleased();
    }

    // keyTyped() {
    //     if (key === 'a') {
    //         this.x -= 5;
    //     }
    // }
}