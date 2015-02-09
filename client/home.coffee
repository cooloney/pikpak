GOOGLE_MAPS_API_URL = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='

Template.home.helpers
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
    Pictures.find({}, {sort:{time:-1}})
