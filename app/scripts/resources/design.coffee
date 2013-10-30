"use strict"
angular.module('websidduApp')
  .factory('Design', ['$resource', '$cookieStore', 'constants', ($resource, $cookieStore, constants) ->
    Design = $resource( constants.base_url + 'api/arts/:id',
      id: '@id'
    ,

    )
    return Design
  ])

