
$(document).ready(function(){
    $.get('/house_rules/tags.json', function(data){
       return data;
    }).done(function(data){
      $("#house_rule_type_tags").select2({
        tags: data
      });
    });

    $.get('/house_rules/tag_cloud.json', function(data){
      return data;
    }).done(function(data){
      $('#tag_cloud').jQCloud(data);
    });

});

