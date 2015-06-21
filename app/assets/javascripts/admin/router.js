// For more information see: http://emberjs.com/guides/routing/

Admin.Router.reopen({
  location: 'history',
  rootURL: '/admin'
});

Admin.Router.map(function() {
  this.resource('blog.posts', { path: '/blog/posts' }, function() {
    this.route('show', { path: '/:id' });
  });
  this.resource('users', function() {
    this.route('show', { path: '/:id' });
  });
});
