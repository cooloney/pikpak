

Template.hello.events
    'click button': ->
      MeteorCamera.getPicture {}, (e,r)->
        if e?
          alert (e.message)
        else
          l = Geolocation.latLng()
          myColl.insert {time:new Date(), pic:r, loc:l}
          uploadCount = (Session.get 'mycount') or 0
          uploadCount += 1
          Session.set 'mycount', uploadCount

    'click img.small-image':(e,t)->
      uploadCount = (Session.get 'mycount') or 0
      if uploadCount > 0
        id = e.target.getAttribute 'data-id'
        myColl.remove id
        Session.set 'mycount', uploadCount - 1
      else
        alert "You cannot delete more pictures than you uploaded (#{uploadCount} pictures)"

Template.hello.helpers
  pictures:->
    myColl.find({}, {sort:{time:-1}})
  position:->
    Geolocation.latLng()
  address:->
    #l = Geolocation.latLng()
    l =
      'lat': 37.3539663
      'lng': -121.9529992
    console.log l
    url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + l.lat + ',' + l.lng+ '&key=AIzaSyCs7eId7TLd46-tJH-9NeT4KMZHf2qOKzI'
    console.log url
    $.getJSON url, (res)->
       console.log res.results[0].formatted_address
       res.results[0].formatted_address
