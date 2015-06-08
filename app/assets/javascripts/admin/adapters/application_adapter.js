// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
Admin.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: '/api',
  pathForType: function(type) {
    return this._super(type).replace(/\./g, '/');
  }
});
