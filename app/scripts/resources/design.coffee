"use strict"
angular.module('websidduApp')
  .factory('Design', ['$resource', 'constants', ($resource, constants) ->
    Design = $resource( constants.base_url + 'api/arts/:id',
      id: '@id'
    )
    return Design
  ])
