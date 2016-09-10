
class CharacterListItem {
  constructor(el) {
    $(el).on('click', this.openSheet);
    $(el).on('click', '.character-list-item__action-icon', this.doNotPropagate);
  }

  openSheet(e) {
    $(e.currentTarget)
      .find('.character-list-item__sheet')
      .toggleClass('character-list-item__sheet--open');
  }

  doNotPropagate(e) {
    e.stopPropagation();
  }
}

export default CharacterListItem;
