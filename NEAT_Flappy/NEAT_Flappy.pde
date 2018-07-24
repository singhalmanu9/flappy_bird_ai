BirdPopulation b;
ArrayList<Pipe> pipes = new ArrayList();
int counter = 1;
int hiScore = 0;
float avgScore = 0;

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
    background(75, 175, 255);

    b.update();

    for (int i = pipes.size() - 1; i >= 0; i --) {
      pipes.get(i).update();
      if (!pipes.get(i).onScreen) {
        pipes.remove(i);
        for (Bird bird : b.birds) {
          if (!bird.dead) { //<>//
            bird.score ++;
          }
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
    fill(255);
    textSize(32);
    text("Gen: " + b.gen, 20, 50);
    
    if (b.gen > 1) {
      fill(0, 255, 0);
      noStroke();
      ellipse(width/2 - 30, 40, 25, 25);
      fill(255, 255, 0);
      ellipse(width/2 - 30, 40, 15, 15);
      textSize(20);
      fill(255);
      text("Best from prev. gen.", width/2, 50);
    }
    
    textSize(32);
    text("Avg. Score: " + avgScore, width/2 - 10, height-50);
    
    text("High Score: " + hiScore, 20, height-50);
    
  }
}