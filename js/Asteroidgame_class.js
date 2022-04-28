class Asteriodgame {
    constructor() {
        this.player = new Player();
    }

    run() {
        this.display();
        this.update();
    }

    display() {
        this.player.display();
    }

    update() {
        this.player.update();
        this.controls();
    }

    controls() {
        this.player.move();
    }

    // keyTyped() {
    //     console.log(key);
    // }
}