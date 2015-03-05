Mixto = require 'mixto'

AEventEmitter = require 'a-event-emitter'

aEventHasListenerFn = require 'a-event-has-listener-fn'

class ACliCommand extends Mixto

  constructor: (@options) ->

    super @options

  extended: () ->

    _mixins = () =>

      AEventEmitter.extend @

    _properties = () =>

      _options = () =>

        if command = @command

          delete @command

          @options ?= {}

          @options.eventNamespace ?= command.name

          @options.commandMain ?= command.main

          @options.commandName ?= command.name

          @options.commandVersion ?= command.version

          @options.commandDescription ?= command.description

          @options.commandSynopsys ?= command.synopsys

          @options.commandUsage ?= command.usage

          @options.commandTriggers ?= command.triggers or []

          @options.commandOptions ?= {}

          for name, option of command.options

            @options.commandOptions[name] ?= option

      _options()

    _methods = () =>

      events =

        "domain-enabled": (domain) =>

          Object.defineProperty @, "cli",

            value: domain

            writeable: false

          @cli.register @

      for method in Object.keys(events)

        if not aEventHasListenerFn method, @

          @["#{method}?"] = events[method].bind @

    _extended = () =>

      _properties()

      _methods()

      _mixins()

    _extended()

module.exports = ACliCommand
