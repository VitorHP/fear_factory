
$(document).ready(function(){
    $.get('/house_rules/tags.json', function(data){
       return data;
    }).done(function(data){
      $("#house_rule_tags").select2({
        tags: data
      });
    });

});

