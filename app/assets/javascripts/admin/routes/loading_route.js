//= require pace/pace
// For more information see: http://emberjs.com/guides/routing/

Admin.LoadingRoute = Ember.Route.extend({
  activate: function() {
    this._super();
    return Pace.restart()
  },
  deactivate: function() {
    this._super();
    return Pace.stop()
  }
});
