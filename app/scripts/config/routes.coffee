"use strict"
websidduApp.config(($routeProvider, $locationProvider) ->
  $routeProvider
  .when("/",
    templateUrl: "views/index.html"
    controller: "MainCtrl"
  )
  .when("/about",
    templateUrl: "views/about.html"
    controller: "MainCtrl"
  )
  .when("/portfolio",
    templateUrl: "views/portfolio.html"
    controller: "portfolioCtrl"
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
              console.log "Unsuccess..."
          )
        deferred.promise
  )
  .when("/design",
    templateUrl: "views/designs.html"
    controller: "designCtrl"
  )
  .when("/designs/:designId",
    templateUrl: "views/design.html"
    controller: "designCtrl"
    resolve:
      delay: ($q, $timeout) ->
        delay = $q.defer()
        $timeout(delay.resolve, 1000)
        delay.promise
  )
  .when("/contact",
    templateUrl: "views/contact.html"
    controller: "contactCtrl"
  )
  .when("/code",
    templateUrl: "views/code.html"
    controller: "codeCtrl"
  )
  .when("/index",
    templateUrl: "views/about.html"
    controller: "aboutController"
  ).otherwise redirectTo: "/"
)
