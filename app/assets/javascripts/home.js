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
            .text($(ui.draggable).text())
            .addClass('with-skill');
          ui.draggable.remove();
        }
    });

    $('#skills').on('click', '.with-skill', function(event){
      $('#skill-list').append('<div class="skill">' + $(event.target).text() + '</div>');
      $(event.target).text('').removeClass('with-skill');
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
