"use strict"
angular.module('websidduApp')
  .factory('Blog', ['$resource', 'constants', ($resource, constants) ->
    Blog = $resource( constants.base_url + 'api/arts/:id',
      id: '@id'
    )
    return Blog
  ])
