## Portfolio website

![WebsiteArchitecture](https://lh3.googleusercontent.com/-FXAsGKpaGeo/U4Ha3zRGgCI/AAAAAAAABT8/s3vhP1YOfbE/s0-U-I/websiddu_site_architecture.png)


For more details read http://blog.websiddu.com/2014/06/26/my-website-is-build-on-open-source/


### Server
I used Ruby on Rails to fetch data from the database. This ruby on rails application is hosted on heroku http://websiddu.herokuapp.com. As you can see its a pretty simple interface with enables me to add/edit/delete/get data. Its controlled by a simple authorization plugin using device gem. So only I've the access. ;)

And this has API end points to get the data so that I can uses the data with more flexibilty. Here is an example of the API endpoint

http://websiddu.herokuapp.com/api/projects

#### Keywords

* Ruby on Rails
* SASS, Foundation
* Device
* Heroku

### Database
I wanted to use a no-sql database for my application as I am not going do any complex relations queries between tables. I chose mongodb with is very quick and easy. And, Mongo lab gives a 500MB database for free. So, I got my DB ready.

#### Keywords

* MongoDB
* Mongo lab
* Mongoid gem
* Nosql

### Front-end
Now I designed the static application using the API. This front-end part is built on Angular.js, SASS and Foundation and deployed on github.

http://websiddu.github.io/websiddu/#/

#### Keywords

* Angular.js
* SASS
* Fondation
* Yeoman
* Grunt
* Bower

### Assets
All the images, screen shots and sources are hosted on google app engine again a free service. First I tried using dropbox, but it truned out that I cannot control the caching time for those files. I wrote a blogpost a while ago how to use google app engine as your static assets server or CDN. Check tihs out http://blog.websiddu.com/2014/01/15/use-google-app-engine-as-cdn/

#### Keywords

* Google app engine

To conclude, in simple this is how I used the open-source to build my portfolio website.

