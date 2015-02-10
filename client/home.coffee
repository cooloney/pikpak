
Template.home.helpers
  hasComments:->
    @comments.length
  pictures:->
    Pictures.find({}, {sort:{time:-1}})
