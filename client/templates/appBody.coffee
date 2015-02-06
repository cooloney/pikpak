GOOGLE_MAPS_API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='

Template.appBody.events
    'click .js-switch':->
      Session.set 'mymode', not Session.get 'mymode'

    'click .js-shot':->
      MeteorCamera.getPicture {}, (e,r)->
        if e?
          alert (e.message)
        else
          l = Session.get 'myloc'
          a = Session.get 'myaddr'
          z = Session.get 'myzip'
          id = myColl.insert {time:new Date(), pic:r, loc:l, address:a, zip:z, comments:[]}
          Router.go 'picShow', {_id: id}

    'click img.js-thumb':(e,t)->
      id = e.target.getAttribute 'data-id'
      console.log id
      Router.go 'picShow', {_id: id}

Template.appBody.helpers
  pos:->
    l = Geolocation.latLng()
    if l
      Session.set 'myloc', l
      url = GOOGLE_MAPS_API_URL + l.lat + ',' + l.lng
      $.getJSON url, (res)->
        if res.status is 'OK'
          a = res.results[0].formatted_address
          z = res.results[1].address_components[0].long_name
          Session.set 'myaddr', a
          Session.set 'myzip', z
        else
           console.log res
    Session.get 'myloc'

  pictures:->
    m = Session.get 'mymode'
    if m # Global mode
      return myColl.find({}, {sort:{time:-1}})
    else # Local mode
      z = (Session.get 'myzip') or ''
      return myColl.find({zip: z}, {sort:{time:-1}}) if z

