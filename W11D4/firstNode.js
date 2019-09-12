const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askTeaBiscuits() {
  let firstAns, secondAns;
  reader.question('Would you like some tea?', (answer) => {
    firstAns = (answer === "yes" ? "do" : "don't");
    console.log(`You replied ${ firstAns }`);
    reader.question("Would you like some biscuits?", (answer) => {
      secondAns = (answer === "yes" ? "do" : "don't");
    });
  });
  console.log(`So you ${firstAns} want tea and you ${secondAns} want coffee.`);
  reader.close();
}
