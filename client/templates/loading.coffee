Template.loading.rendered = ->
  latLng = Geolocation.latLng()
  @autorun ->
    latLng = Geolocation.latLng()
    if latLng?
      IonLoading.hide()
      Session.set 'keyLocation', latLng
    else
      IonLoading.show()