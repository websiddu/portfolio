"use strict"
angular.module('websidduApp')
  .factory('Design', ['$resource', 'constants', ($resource, constants) ->

    Design = $resource(constants.base_url + 'api/arts/:id', { callback: 'JSON_CALLBACK', isArray: true },
      get:
        method: 'JSONP'
      query:
        method: 'JSONP'
        isArray: true
    )
    return Design
  ])
