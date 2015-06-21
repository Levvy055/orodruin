// For more information see: http://emberjs.com/guides/routing/

Admin.BlogPostsShowRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('blog.post', params.id);
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
