//= require jquery
//= require jquery_ujs
//= require ember
//= require ember-data
//= require_self
//= require ./admin

// for more details see: http://emberjs.com/guides/application/
window.Admin = Ember.Application.create({
  LOG_TRANSITIONS: true,
  LOG_TRANSITIONS_INTERNAL: true,
  LOG_VIEW_LOOKUPS: true
});
