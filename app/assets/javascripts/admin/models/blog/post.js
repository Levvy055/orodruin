// for more details see: http://emberjs.com/guides/models/defining-models/

Admin.BlogPost = DS.Model.extend({
  author:     DS.belongsTo('User'),

  title:      DS.attr('string'),
  text:       DS.attr('string'),
  createdAt:  DS.attr('date'),
  updatedAt:  DS.attr('date')
});
