
require 'shelljs/make'

mission = require 'mission'

target.sync = ->
  mission.rsync
    file: './'
    options:
      dest: 'tiye:~/repo/topics-server'
      exclude: [
        'README.md'
        'make.coffee'
        'node_modules'
      ]