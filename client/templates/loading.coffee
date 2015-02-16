Template.loading.rendered = ->
  latLng = Geolocation.latLng()
  console.log "out of autorun location:", latLng
  @autorun ->
    latLng = Geolocation.latLng()
    console.log "now location:", latLng
    if latLng?
      IonLoading.hide()
      Session.set 'keyLocation', latLng
    else
      IonLoading.show()
        
    
