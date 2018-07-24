class BirdPopulation {

  ArrayList<Bird> birds;
  Bird best;
  int gen = 1;

  BirdPopulation(int num) {
    birds = new ArrayList();
    for (int i = 0; i < num; i ++) {
      birds.add(new Bird());
    }
  }

  void update() {
    for (Bird b : birds) {
      b.update(b.best); //<>//
    }
  }

  boolean allDead() {
    for (Bird b : birds) {
      if (!b.dead)
        return false;
    }
    return true;
  }

  void calcFitness() {
    Bird best = null;
    float total = 0;
    for (Bird bird : birds) {
      bird.calcFitness();
      total += bird.fitness;
      if (best == null || bird.fitness > best.fitness)
        best = bird;
    }
    this.best = new Bird(best.brain);
    this.best.best = true;
    
    for (Bird bird : birds) {
      bird.fitness /= total;
    }
  }

  void naturalSelection() {
    ArrayList<Bird> newBirds = new ArrayList();
    for (int i = 1; i < birds.size(); i ++) {
      Bird parent = chooseParent();
      Bird child = new Bird(parent.brain.clone());
      newBirds.add(child);
    }
    newBirds.add(best);
    birds = (ArrayList<Bird>) newBirds.clone();
    gen ++;
  }

  Bird chooseParent() {
    float rand = random(1);
    float temp = 0;
    for (Bird b : birds) {
      temp += b.fitness;
      if (temp > rand) {
        return b;
      }
    }
    return birds.get(birds.size()-1);
  }

  void mutate() {
    for (Bird b : birds)
      b.brain.mutate();
  }
}