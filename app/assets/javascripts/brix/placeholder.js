KISSY.add("brix/gallery/placeholder/index",function(e,t){function i(){return"placeholder"in document.createElement("input")?{}:(i.superclass.constructor.apply(this,arguments),void 0)}return i.ATTRS={labelShowCls:{value:"s-placeholder"},label:{}},i.EVENTS={"":{keyup:function(e){var t=this,i=t.label,a=t.get("labelShowCls");""===e.target.value?i.addClass(a):i.removeClass(a)}}},e.extend(i,t,{initialize:function(){var t=this,i=e.DOM,a=t.get("el"),n=a.getDOMNode(),r=t.get("labelShowCls");if("INPUT"===n.tagName.toUpperCase()){var o=a.attr("placeholder"),s=e.one(i.create('<label class="'+r+'" for="'+n.id+'">'+o+"</label>"));s.insertBefore(a),t.label=s,""!=n.value&&s.removeClass(r)}},destructor:function(){this.label&&(this.label=null)}}),i},{requires:["brix/core/brick"]});