"use strict"
angular.module('websidduApp')
  .factory('Project', ['$resource', 'constants', ($resource, constants) ->


    Project = $resource( constants.base_url + 'api/projects/:id',
      id: '@id'
    ,

    )
    return Project
  ])
