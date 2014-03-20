
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var SkillManager = {
  init: function(){
    var _this = this;
    this.bindDraggables();

    $('.slot').droppable({
        accept: function(draggable, tchubas, rubas){
          return !$(this).hasClass('with-skill');
        },
        drop: function(event, ui){
          $(event.target)
            .addClass('with-skill')
            .find('span.name').text($(ui.draggable).text())
          $(event.target)
            .find('.character_ratings_skill_id input')
              .val($(ui.draggable).data('id'));
          ui.draggable.remove();
        }
    });

    $('#skills').on('click', '.with-skill', function(event){
      $('#skill-list').append('<div class="skill" data-id=' + $(event.target).find('.character_ratings_skill_id input').val() + '>' + $(event.target).text() + '</div>');
      $(event.target)
        .removeClass('with-skill')
        .find('span.name').text('');
      $(event.target)
        .find('.character_ratings_skill_id input').val('');
      _this.bindDraggables();
    })
  },

  bindDraggables: function(){
    $('div.skill').draggable({ revert: 'invalid' });
  }
}

$(document).ready(function(){
  SkillManager.init();
});
