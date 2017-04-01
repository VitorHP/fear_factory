import Skill from 'modules/skill';

class CharacterForm {
  constructor() {
    $(document).on('cocoon:after-insert', (e, inserted) =>
      new Skill(inserted.find('.skill')));
  }
}

export default CharacterForm;
