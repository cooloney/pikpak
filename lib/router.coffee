Router.configure
#  layoutTemplate: 'appBody',
  notFoundTemplate: 'appNotFound'

Router.route '/', 'appBody'

Router.route '/picShow/:_id', (->
  @render 'picShow', data: ->
    myColl.findOne _id: @params._id
), name: 'picShow'
