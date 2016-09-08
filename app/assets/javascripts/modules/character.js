
function Character (el) {
  $(el).on('click', this.openSheet)
  $(el).on('click', '.character-list-item__edit-icon', this.doNotPropagate)
}

Character.prototype.openSheet = function(e) {
  $(e.currentTarget).find(".character-list-item__sheet").toggleClass('character-list-item__sheet--open');
}

Character.prototype.doNotPropagate = function(e) {
  e.stopPropagation();
}

module.exports = Character;
