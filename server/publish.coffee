Meteor.publish "Pictures", (loc) ->
  # Find documents in 3km range
  # Pictures.find {"loc": {$near : loc, $maxDistance : 3/111.12}}, {sort : {time : -1}}
  Pictures.find {}, limit : 100,
