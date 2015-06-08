// For more information see: http://emberjs.com/guides/routing/

Admin.Router.reopen({
  location: 'history',
  rootURL: '/admin'
});

Admin.Router.map(function() {
  this.route('blog', function() {
    this.resource('blog.posts', { path: '/posts' });
  });
});
