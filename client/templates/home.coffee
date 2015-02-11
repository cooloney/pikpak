Template.home.events
  'click .js-pic-show':(event)->
    picId = event.target.getAttribute 'data-id'
    Router.go 'picShow', {_id: picId}

Template.home.helpers
  hasComments:->
    @comments.length
  pictures:->
    l = Geolocation.latLng()
    if l
      Session.set 'keyLocation', l
      # Find documents in 3km range
      Pictures.find {"loc": {$near : l, $maxDistance : 3/111.12}}, {sort : {time : -1}}