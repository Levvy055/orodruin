// For more information see: http://emberjs.com/guides/routing/

Admin.Router.map(function() {
  this.resource('blog.posts', { path: '/blog/posts' });
});
