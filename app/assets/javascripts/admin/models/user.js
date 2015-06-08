// for more details see: http://emberjs.com/guides/models/defining-models/

Admin.User = DS.Model.extend({
  email:       DS.attr('string'),
  firstName:  DS.attr('string'),
  lastName:   DS.attr('string'),
  nickname:    DS.attr('string'),
  birthday:    DS.attr('string'),

  fullName: function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }.property('firstName', 'lastName')
});
