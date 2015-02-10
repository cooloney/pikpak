Template.home.events
  'click .js-pic-show':(event)->
    picId = event.target.getAttribute 'data-id'
    Router.go 'picShow', {_id: picId}

Template.home.helpers
  hasComments:->
    @comments.length
  pictures:->
    Pictures.find({}, {sort:{time:-1}})
