// For more information see: http://emberjs.com/guides/routing/

Admin.ApplicationRoute = Ember.Route.extend({
  model: function() {
    var store = this.store;
    return $.getJSON('/api/users/me').then(function(data) {
      store.pushPayload(data);
      return store.find('user', data.user.id);
    });
  }
});
