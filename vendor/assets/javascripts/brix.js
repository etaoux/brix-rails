//= require brix/base
//= require brix/breadcrumbs
//= require brix/colorpicker
//= require brix/dialog
//= require brix/dropdown
//= require brix/fold
//= require brix/form
//= require brix/inplaceeditor
//= require brix/kwicks
//= require brix/pagination
//= require brix/starrating
//= require brix/switcher
//= require brix/loading

KISSY.ready(function(){
  // Init Brix components
  KISSY.use("brix/core/pagelet", function(S, Pagelet) {
    brixPagelet = new Pagelet({tmpl:'body'});
    brixPagelet.addBehavior();

    brixPagelet.ready(function(){

      // Special fix for Switcher use in Form sunmit
      S.all("[bx-name='switcher']").each(function(el){
        brixPagelet.getBrick(el.attr("id")).on("switch", function(e){
          el.one("input").val(e.value);
        })
      })
    })

  })
})
