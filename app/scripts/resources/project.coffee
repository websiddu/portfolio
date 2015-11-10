"use strict"
angular.module('websidduApp')
  .factory('Project', ['$resource', 'constants', ($resource, constants) ->
    Project = $resource(constants.base_url + 'api/projects/:id', { callback: 'JSON_CALLBACK', isArray: true },
      get:
        method: 'JSONP'
        timeout: 1000
      query:
        method: 'JSONP'
        isArray: true
        timeout: 1000
    )
    return Project
  ])
