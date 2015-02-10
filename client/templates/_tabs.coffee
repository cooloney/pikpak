Template._tabs.events
  'click .js-shot':->
    MeteorCamera.getPicture {}, (e,r)->
      if e?
        console.log e.message
      else
        l = Session.get 'myloc'
        a = Session.get 'myaddr'
        z = Session.get 'myzip'
        id = Pictures.insert
               time : new Date()
               pic : r
               loc : l
               address : a
               zip : z
               comments : []
        Router.go 'picShow', {_id: id}
