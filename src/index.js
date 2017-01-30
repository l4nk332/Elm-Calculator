'use strict';

require('./index.html');
require('normalize.css');
require('./styles/sass/main.sass');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);
