KISSY.add("brix/gallery/lavalamp/index",function(e,t,i,a){function n(){n.superclass.constructor.apply(this,arguments)}return n.ATTRS={fx:{value:"bounceOut"},speed:{value:.4},triggered:{value:"mouseover"},click:{value:function(){}}},e.extend(n,t,{initialize:function(){function e(e){s.css({left:e.offsetLeft+"px",width:e.offsetWidth+"px"}),c=e}function t(e){n&&n.stop(),n=new i(s[0],{width:e.offsetWidth+"px",left:e.offsetLeft+"px"},r.get("speed"),r.get("fx")),n.run()}var n,r=this,o=r.get("el"),s=new a('<li class="back"></li>'),l=o.all("li"),c=(o.one(".current")||l[0].addClass("current"))[0];o.append(s),l.each(function(i){"mouseover"==r.get("triggered")?(i.on("mouseenter",function(){t(i[0])}),i.on("click",function(t){return e(i[0]),r.get("click").apply(r,[t])})):i.on("click",function(a){return t(i[0]),e(i[0]),r.get("click").apply(r,[a])})}),o.on("mouseleave",function(){t(c)}),e(c)},destructor:function(){}}),n},{requires:["brix/core/brick","anim","node"]});