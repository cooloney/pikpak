Router.configure
  layoutTemplate: 'tabsLayout'
  waitOn: ->
    l = Geolocation.latLng()
    if l
      Session.set 'keyLocation', l
      Meteor.subscribe 'Pictures', l
      if @ready()
        dataReadyHold.release();

dataReadyHold = null;
if Meteor.isClient
  dataReadyHold = LaunchScreen.hold()

Router.map ->
  @route 'home', path: '/'
  @route 'picShow', path: '/picShow/:_id',
    data: ->
      Pictures.findOne _id: @params._id
  @route 'settings', path: '/settings'
  @route 'me', path: '/me'
