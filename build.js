const feather = require('feather-icons');

require('./source-builder.js')
    .Headless
    .worker(Object.keys(feather.icons).map(x => ([ x, feather.icons[x]])))
    .ports
    .output
    .subscribe(x => console.log(x));
