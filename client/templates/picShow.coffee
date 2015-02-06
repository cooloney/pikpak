Template.picShow.events
  'click .js-pic-show':->
    Router.go '/'
  'click .js-send':(e, t)->
    comment = t.$('[name=comment]').val()
    myColl.update {_id: t.data._id}, {$push: {comments : comment}}
