Router.configure
  layoutTemplate: 'tabsLayout'
  loadingTemplate: 'loading'
  # waitOn: ->
  #   l = Geolocation.latLng()
  #   if l
  #     Session.set 'keyLocation', l
  #     Meteor.subscribe 'Pictures', l

Router.map ->
  @route 'home', 
    path: '/'
    action:->
      if Session.get 'keyLocation'
        @render()
      else
        @render 'loading'

  @route 'picShow', path: '/picShow/:_id',
    data: ->
      Pictures.findOne _id: @params._id
  @route 'settings', path: '/settings'
  @route 'me', path: '/me'
