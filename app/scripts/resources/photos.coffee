"use strict"
angular.module('websidduApp')
  .factory('Photos', ['$http', 'constants', ($http, constants) ->
    settings =
      flickrSet: "72157637193562255"
      flickrKey: "09760874ef67f578f4639472ad295afb"
    this.get = ->
      $http(
        method: "JSONP"
        url: "http://api.flickr.com/services/rest/?format=json&method=flickr.photosets.getPhotos&photoset_id=" + settings.flickrSet + "&api_key=" + settings.flickrKey + "&jsoncallback=JSON_CALLBACK"
      )

    return this
  ])

