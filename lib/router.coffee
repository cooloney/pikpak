Router.configure
  layoutTemplate: 'tabsLayout'

Router.map ->
  @route 'home',
    {
      path: '/'
      waitOn: ->
        l = Geolocation.latLng()
        if l
          Session.set 'keyLocation', l
          Meteor.subscribe 'Pictures', l
    }
  @route 'picShow', path: '/picShow/:_id',
    data: ->
      Pictures.findOne _id: @params._id
  @route 'settings', path: '/settings'
  @route 'me', path: '/me'
