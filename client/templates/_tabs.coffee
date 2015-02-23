Template._tabs.events
  'click .js-shot':->
    MeteoricCamera.getPicture {width: 1920, height: 1080, quality: 100}, (e,r)->
      if e?
        console.log e.message
      else
        l = Session.get 'keyLocation'
        id = Pictures.insert
               time : new Date()
               pic : r
               loc : l
               comments : []
        Router.go 'picShow', {_id: id}