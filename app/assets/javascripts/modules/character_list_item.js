
function CharacterListItem (el) {
  $(el).on('click', this.openSheet)
  $(el).on('click', '.character-list-item__action-icon', this.doNotPropagate)
}

CharacterListItem.prototype.openSheet = function(e) {
  $(e.currentTarget).find(".character-list-item__sheet").toggleClass('character-list-item__sheet--open');
}

CharacterListItem.prototype.doNotPropagate = function(e) {
  e.stopPropagation();
}

module.exports = CharacterListItem;
