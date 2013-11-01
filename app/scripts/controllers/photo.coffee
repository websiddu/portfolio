"use strict"
angular.module("websidduApp").controller "photoCtrl", ($scope, $rootScope, Photos) ->

  photos = []

  Photos.get().success( (flickrData) ->
    i = 0
    while i < flickrData.photoset.photo.length
      photo =
        photoUrl: "http://farm" + flickrData.photoset.photo[i].farm + "." + "static.flickr.com/" + flickrData.photoset.photo[i].server + "/" + flickrData.photoset.photo[i].id + "_" + flickrData.photoset.photo[i].secret + ".jpg"
        title: flickrData.photoset.photo[i].title
        linkUrl: "http://www.flickr.com/photos/#{flickrData.photoset.owner}/#{flickrData.photoset.photo[i].id}/in/set-#{flickrData.photoset.id}"
      photos.push(photo)
      i++
    $scope.photos = photos
  )


# http://www.flickr.com/photos/107302365@N05/10610673085/in/set-72157637193562255






