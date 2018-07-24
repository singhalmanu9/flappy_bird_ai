BirdPopulation b;
ArrayList<Pipe> pipes = new ArrayList();
int counter = 1;

void resetGame() {
  pipes = new ArrayList();
  pipes.add(new Pipe(random(100, 500)));
  counter = 1;
}

void setup() {
  size(600, 800);
  b  = new BirdPopulation(500);
  pipes.add(new Pipe(random(100, 500)));
}

void draw() {
  for (int c = 0; c < 5; c ++) {
    background(255);

    b.update();

    for (int i = pipes.size() - 1; i >= 0; i --) {
      pipes.get(i).update();
      if (!pipes.get(i).onScreen) {
        pipes.remove(i);
        for (Bird bird : b.birds) {
          if (!bird.dead) {
            bird.score ++;
          } //<>//
        }
      }
    }

    if (b.allDead()) {
      b.calcFitness();
      b.naturalSelection();
      b.mutate();
      resetGame();
    }

    if (counter % 100 == 0)
      pipes.add(new Pipe(random(100, 500)));

    counter ++;
    fill(255, 0, 0);
    textSize(32);
    text("" + b.gen, 50, 50);
  }
}