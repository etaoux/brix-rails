KISSY.add("brix/gallery/inplaceeditor/index",function(a,b){function c(){c.superclass.constructor.apply(this,arguments)}return c.ATTRS={autoRender:{value:!0},tmpl:{value:'<div class="inplaceeditor-popup"><input type="text" value=""></div>'}},c.ATTACH={input:{focusout:function(a){this.hide()},keydown:function(a){a.keyCode==13&&this.hide()}}},c.METHOD={show:function(a,b,c,d){var e=this.get("el"),f=e.one("input");e.css({visibility:"visible",left:a,top:b}),this._v=c,d&&f.css(d),f[0].focus(),f.val(c)},hide:function(){var a=this.get("el");a.css({visibility:"hidden",left:"-9999px",top:"-9999px"});var b=this.getValue();this._v!=b&&this.fire("valueChange",{value:b})},getValue:function(){var a=this.get("el");return a.one("input").val()}},a.extend(c,b,{_v:null}),a.augment(c,c.METHOD),c},{requires:["brix/core/brick","./inplaceeditor.css"]});