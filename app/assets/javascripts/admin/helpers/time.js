//= require momentjs
//= require momentjs/min/locales

Ember.Handlebars.registerBoundHelper('format-time', function(time, options) {
  if (!time) return '';
  return moment(time).format(options.hash.format || 'LLL');
});
