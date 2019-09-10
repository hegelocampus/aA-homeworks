function madLib(verb, adjective, noun) {
  return "We shall " + verb + " the " + adjective + " " + noun + ".";
}

//console.log(madLib("eat", "fat", "snacks"));

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

//console.log(isSubstring("time to program", "time"))
//console.log(isSubstring("time to program", "dogs"))

function fizzBuzz(array) {
  var newArr = [];
  array.forEach(function(num) {
    if (num % 3 === 0 && num % 5 === 0) {
      return nil;
    }else if (num % 3 === 0 || num % 5 === 0) {
      newArr.push(num);
    }
  });
  return newArr;
}
//var arr = [1, 2, 3, 4, 5, 6, 7, 8];
//console.log(fizzBuzz(arr))

function isPrime(number) {
  for(let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

//console.log(isPrime(7))
//console.log(isPrime(2))
//console.log(isPrime(6))
//console.log(isPrime(1))

function firstNPrimes(num) {
  var primes = [];
  var count = 0;
  var i = 2;
  while(count < num) {
    if(isPrime(i)) {
      primes.push(i);
      count += 1;
    }
    i += 1;
  }
  return primes;
}

//console.log(firstNPrimes(6))

function sumOfPrimes(num) {
  var sum = 0;
  var arr = firstNPrimes(num);
  arr.forEach(function(pNum){
    sum += pNum;
  });
  return sum;
}
console.log(sumOfPrimes(1))
console.log(sumOfPrimes(2))
console.log(sumOfPrimes(3))
console.log(sumOfPrimes(8))
