// for more details see: http://emberjs.com/guides/controllers/

Admin.UsersController = Ember.Controller.extend({
  actions: {
    show: function(user) {
      this.transitionToRoute('users.show', user.id);
    }
  }
});
