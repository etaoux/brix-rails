KISSY.add("brix/gallery/switcher/index",function(a,b){function c(){c.superclass.constructor.apply(this,arguments)}return c.ATTRS={switchOn:{value:!1},switchStatus:{value:!0}},c.METHOD={switchTo:function(a){var b=this;b._switchTo(a)}},c.FIRES={switched:"switched"},c.ATTACH={"":{click:function(a){var b=this.get("el");this._switchTo(!b.hasClass("switcher-on"))}}},a.extend(c,b,{initialize:function(){var a=this;a.get("switchOn")?a._switchTo(!0):a._switchTo(!1)},_switchTo:function(a){var b=this,d=b.get("el");a?(d.addClass("switcher-on"),b.get("switchStatus")||d.addClass("switcher-no-status")):(d.removeClass("switcher-on"),b.get("switchStatus")||d.removeClass("switcher-no-status")),data={value:d.hasClass("switcher-on")},b.fire(c.FIRES.switched,data)}}),a.augment(c,c.METHOD),c},{requires:["brix/core/brick"]});