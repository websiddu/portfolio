"use strict"
angular.module('websidduApp')
  .factory('Project', ['$resource', '$cookieStore', 'constants', ($resource, $cookieStore, constants) ->
    Project = $resource( constants.base_url + 'api/projects/:id',
      id: '@id'
    ,

    )
    return Project
  ])

