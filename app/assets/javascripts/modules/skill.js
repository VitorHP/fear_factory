
class Skill {
  constructor(el) {
    this.$skill = $(el);
    this.$checks = this.$skill.find('.skill__check');
    this.$levelInput = this.$skill.find('.skill__level-input');

    this.$checks.on('click', this.clickSkill.bind(this));
  }

  clickSkill(e) {
    const targetValue = $(e.target).hasClass('skill__check--checked') ?
      $(e.target).data('value') - 1 :
      $(e.target).data('value');

    this.$checks.removeClass('skill__check--checked');

    this.$checks.map((index, check) => {
      const $check = $(check);

      if ($check.data('value') <= targetValue) {
        $check.addClass('skill__check--checked');
      }

      this.$levelInput.val(targetValue);

      return false;
    });
  }
}

export default Skill;
