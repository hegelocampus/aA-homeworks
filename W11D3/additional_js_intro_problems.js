function titleize(names, funk) {
  let newNames = names.map(name => `Mx. ${ name } Jingleheimer Schmidt`);
  funk(newNames);
}

function printCallback(arr) {
  arr.forEach(function(ele) {
    console.log(ele);
  });
}

function Elephant(newName, newHeight, new_tricks = []) {
  this.name = newName;
  this.height = newHeight;
  this.tricks = new_tricks;
  console.log(`Welcome ${ name } to the club!`);
}

Elephant.prototype.trumpet = function() {
  console.log(`${ this.name } the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(new_trick) {
  this.tricks.push(new_trick);
}

Elephant.prototype.play = function() {
  let rand = getRandomInt(this.tricks.length);
  console.log(this.tricks[rand]);
}

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
  console.log(`${ elephant.name } is trotting by`)
}

herd.forEach(function(elephant) {
  Elephant.paradeHelper(elephant);
});

function dinerBreakfast(newItem) {
  self.order = "I'd like scrambled eggs please";
  var funk = function(newItem) { 
    if (newItem !== undefined) {
      self.order += (" and " + newItem);
    };
    return self.order;
  };
  return funk;
}

