"use strict"
websidduApp.config(($routeProvider, $locationProvider) ->
  $routeProvider
  .when("/",
    templateUrl: "views/index.html"
    controller: "MainCtrl"
    title: "Home – Siddhartha Gudipati, UX designer & Front-end Engineer"
    # resolve:
    #   projects: ($q, Project) ->
    #     deferred = $q.defer()
    #     Project.query((data) ->
    #       deferred.resolve data
    #       , (data) ->
    #         deferred.reject "Unsuccess"
    #     )
    #     deferred.promise
  )
  .when("/about",
    templateUrl: "views/about.html"
    controller: "aboutCtrl"
    title: "About – Siddhartha Gudipati"
  )
  .when("/portfolio",
    templateUrl: "views/portfolio.html"
    controller: "portfolioCtrl"
    title: "Portfolio – Siddhartha Gudipati"
    resolve:
      projects: ($q, Project) ->
        deferred = $q.defer()
        Project.query((data) ->
          deferred.resolve data
          , (data) ->
            deferred.reject "Unsuccess"
        )
        deferred.promise
  )
  .when("/projects/:projectId",
    templateUrl: "views/project.html"
    controller: "projectCtrl"
    resolve:
      project: ($q, $timeout, Project, $route) ->
        deferred = $q.defer()
        Project.get(
          id: $route.current.params.projectId
          , (data) ->
              deferred.resolve data
          , (data) ->
              deferred.reject "Unsuccess"
          )
        deferred.promise
  )
  .when("/design",
    templateUrl: "views/designs.html"
    controller: "designsCtrl"
    resolve:
      designs: ($q, Design) ->
        deferred = $q.defer()
        Design.query((data) ->
          deferred.resolve data
          , (data) ->
            deferred.reject "Unsuccess"
        )
        deferred.promise
  )
  .when("/designs/:designId",
    templateUrl: "views/design.html"
    controller: "designCtrl"
    resolve:
      design: ($q, $timeout, Design, $route) ->
        deferred = $q.defer()
        Design.get(
          id: $route.current.params.designId
          , (data) ->
              deferred.resolve data
          , (data) ->
              deferred.reject "Unsuccess"
          )
        deferred.promise
  )
  .when("/contact",
    templateUrl: "views/contact.html"
    controller: "contactCtrl",
    title: "Contact details"
  )
  .when("/photos",
    templateUrl: "views/photo.html"
    controller: "photoCtrl"
  )
  .when("/blog",
    templateUrl: "views/blog.html"
    controller: "blogCtrl"
  )
  .when("/code",
    templateUrl: "views/code.html"
    controller: "codeCtrl"
  )
  .otherwise
    templateUrl: "views/404.html"
    controller: "404Ctrl"
)

websidduApp.config(($sceProvider) ->
  $sceProvider.enabled(false);
)

