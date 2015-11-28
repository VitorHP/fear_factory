
function Character (el) {
  $(el).on('click', this.openSheet)
}

Character.prototype.openSheet = function(e) {
  $(e.currentTarget).find(".character__sheet").toggleClass('character__sheet--open');
}

module.exports = Character;
