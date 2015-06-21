//= require js-md5
// for more details see: http://emberjs.com/guides/components/

Admin.GravatarImgComponent = Ember.Component.extend({
  size: 96,
  email: '',
  fallback: 'mm',
  rating: 'pg',

  gravatarUrl: function() {
    var email = this.get('email');
    var size  = this.get('size');
    var fallback = this.get('fallback');
    var rating = this.get('rating');

    return [
      'https://www.gravatar.com/avatar/',
      md5(email),
      '?', $.param({
        s: size,
        d: fallback,
        r: rating})].join('');
  }.property('size', 'email', 'fallback', 'rating')
});
