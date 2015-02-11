@Pictures = new Mongo.Collection 'pictures'

# Setup 2D index for Geo location search in server
if Meteor.isServer
  Pictures._ensureIndex {'loc': '2d'}
