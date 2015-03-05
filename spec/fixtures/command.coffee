kosher.alias 'ACliCommand'

class ACommand

  constructor: (@options={}) ->

    kosher.ACliCommand.extend @

class A extends ACommand

  command:

    name: 'a'

    synopsys: []

    options:

      param:

        alias: "p"

        usage: []

        description: []

      action:

        alias: "a"

        usage: []

        description: []

  "action?": () ->

module.exports =

  "A": A
