# grunt-haml-sass-boilerplate

This is a development environment that we used on a couple of projects where Haml and ScSS were used. The templates were eventually integrated into a Rails codebase but as our job was only to design and develop the front-end for the website, we wanted something fast & light-weight to develop the front-end on.

## Features
- Uses Grunt
- Has auto reloading web server
- Compiles Haml templates (using Ruby haml)
- Compiles ScSS
- Coffeescript compiling & linting
- PNG, JPG, GIF and SVG minification

## Usage

    $ git clone https://github.com/Form5/grunt-haml-sass-boilerplate.git
    $ npm install
    $ grunt server

## Directory structure

- Haml templates in the views directory are compiled into html files residing in the dist folder
- main.scss is the single-entry file, where all other scss code is imported
- Images are automatically minified and copied
- Coffeescript is automatically compiled and copied

    ├── Gruntfile.coffee
    ├── LICENSE
    ├── Package.json
    ├── README.md
    ├── assets
    │   ├── images
    │   ├── javascript
    │   └── stylesheets
    │       ├── main.scss
    │       └── vendor
    ├── dist
    │   ├── assets
    │   │   ├── images
    │   │   └── stylesheets
    │   │       └── main.css
    │   └── frontpage.html
    └── views
        ├── frontpage.haml
        └── shared
            ├── head.haml
            └── javascript.haml

## Author

Form5 is a small interactive studio based in Reykjavík, Iceland. We design and build websites and apps. To learn more about us, check out [www.Form5.is](http://www.form5.is).