Router.configure({
//  layoutTemplate: 'appBody',
  notFoundTemplate: 'appNotFound',
});

Router.route('/', 'appBody');
Router.route('/picShow/:_id', function() {
  this.render('picShow', {
    data: function() {
      return myColl.findOne({_id: this.params._id});
    }
  });
}, {
  name: 'picShow'
});
