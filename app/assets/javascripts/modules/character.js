
function Character (el) {
  $(el).on('click', this.openSheet)
  $(el).on('click', '.character-list-item__action-icon', this.doNotPropagate)
}

Character.prototype.openSheet = function(e) {
  $(e.currentTarget).find(".character-list-item__sheet").toggleClass('character-list-item__sheet--open');
}

Character.prototype.doNotPropagate = function(e) {
  debugger
  e.stopPropagation();
}

module.exports = Character;
