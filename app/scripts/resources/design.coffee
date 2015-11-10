"use strict"
angular.module('websidduApp')
  .factory('Design', ['$resource', 'constants', ($resource, constants) ->

    Design = $resource(constants.base_url + 'api/arts/:id', { callback: 'JSON_CALLBACK', isArray: true },
      get:
        method: 'JSONP'
        timeout: 300
      query:
        method: 'JSONP'
        isArray: true
        timeout: 300
    )
    return Design
  ])
