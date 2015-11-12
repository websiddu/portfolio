"use strict"
angular.module('websidduApp')
  .factory('Project', ['$resource', 'constants', ($resource, constants) ->
    Project = $resource(constants.base_url + 'api/projects/:id', { callback: 'JSON_CALLBACK', isArray: true },
      get:
        method: 'JSONP'
      query:
        method: 'JSONP'
        isArray: true
    )
    return Project
  ])
