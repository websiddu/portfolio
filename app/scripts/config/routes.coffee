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
    # resolve:
    #   delay: ($q, $timeout) ->
    #     delay = $q.defer()
    #     $timeout(delay.resolve, 1000)
    #     delay.promise
  )
  .when("/photo",
    templateUrl: "views/photo.html"
    controller: "photoCtrl"
  )
  .when("/contact",
    templateUrl: "views/contact.html"
    controller: "contactCtrl"
  )
  .when("/index",
    templateUrl: "views/about.html"
    controller: "aboutController"
  )
  .when("/index",
    templateUrl: "views/about.html"
    controller: "aboutController"
  ).otherwise redirectTo: "/"
)
