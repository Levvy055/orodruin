// for more details see: http://emberjs.com/guides/models/defining-models/

Admin.BlogPost = DS.Model.extend({
  title: DS.attr(),
  text: DS.attr()
});
