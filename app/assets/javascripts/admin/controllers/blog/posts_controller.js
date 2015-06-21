// for more details see: http://emberjs.com/guides/controllers/

Admin.BlogPostsController = Ember.Controller.extend({
  actions: {
    show: function(post) {
      this.transitionToRoute('blog.posts.show', post.id);
    }
  }
});
