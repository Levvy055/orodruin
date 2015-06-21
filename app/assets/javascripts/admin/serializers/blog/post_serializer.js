Admin.BlogPostSerializer = Admin.ApplicationSerializer.extend({
  modelNameFromPayloadKey: function(key) {
    if (key === 'posts') {
      return 'BlogPost';
    }

    return this._super(key);
  },
  attrs: {
    author: { embedded: 'always' }
  }
});
