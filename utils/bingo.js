export const bingo = (amount) => {
  const numbers = [];
  const riffledNumbers = [];

  for (let i = 1; i <= amount; i++) {
    numbers.push(i);
  }

  const generateRandomInteger = (max) => {
    return Math.floor(Math.random() * max);
  };

  while (riffledNumbers.length < amount) {
    const riffled = generateRandomInteger(numbers.length);

    riffledNumbers.push(numbers[riffled]);
    numbers.splice(riffled, 1);
  }

  return riffledNumbers;
};

export const createCartela = (amount, cartelas) => {
  let numbers;
  let cartela;

  const generateRandomInteger = (max) => {
    return Math.floor(Math.random() * max);
  };

  do {
    numbers = [];
    cartela = [];

    for (let i = 1; i <= amount; i++) {
      numbers.push(i);
    }

    let cartelaAmount;

    switch (generateRandomInteger(3)) {
      case 0:
        cartelaAmount = 16;
        break;

      case 1:
        cartelaAmount = 17;
        break;

      case 2:
        cartelaAmount = 18;
        break;

      default:
        cartelaAmount = 16;
    }

    for (let i = 1; i <= cartelaAmount; i++) {
      const riffled = generateRandomInteger(numbers.length);

      cartela.push(numbers[riffled]);
      numbers.splice(riffled, 1);
    }

  } while (
    cartelas.find(
      (el) => JSON.stringify(el) === JSON.stringify(cartela)
    ) !== undefined
  );

  return cartela;
};
