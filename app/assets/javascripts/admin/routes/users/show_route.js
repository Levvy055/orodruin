// For more information see: http://emberjs.com/guides/routing/

Admin.UsersShowRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('user', params.id);
  },
  renderTemplate: function() {
    this.render({
      into: 'application',
      outlet: 'modal'
    });
  },
  deactiveate: function() {
    this.render('empty', {
      into: 'application',
      outlet: 'modal'
    });
  }
});
