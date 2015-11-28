
var Character = require("./modules/character")

function Home () {
  this.characters = $(".character").map(function(index, character){
    return new Character(character)
  })
}

module.exports = Home;
