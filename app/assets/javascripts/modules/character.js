
function Character (el) {
  $(el).on('click', this.openSheet)
  $(el).on('click', '.character__edit-icon', this.doNotPropagate)
}

Character.prototype.openSheet = function(e) {
  $(e.currentTarget).find(".character__sheet").toggleClass('character__sheet--open');
}

Character.prototype.doNotPropagate = function(e) {
  e.stopPropagation();
}

module.exports = Character;
