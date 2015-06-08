// For more information see: http://emberjs.com/guides/routing/

Admin.UsersRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('user');
  }
});
