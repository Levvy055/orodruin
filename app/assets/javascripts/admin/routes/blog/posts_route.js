// For more information see: http://emberjs.com/guides/routing/

Admin.BlogPostsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('blog.post');
  }
});
