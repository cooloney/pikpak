Router.configure
  layoutTemplate: 'tabsLayout'
  loadingTemplate: 'loading'

Router.map ->
  @route 'home', 
    path: '/'
    action:->
      latLng = Session.get 'keyLocation'
      if latLng
        Meteor.subscribe 'Pictures', latLng
        @render()
      else
        @render 'loading'

  @route 'picShow', path: '/picShow/:_id',
    data: ->
      Pictures.findOne _id: @params._id
  @route 'settings', path: '/settings'
  @route 'me', path: '/me'
