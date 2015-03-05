describe 'ACliCommand', () ->

  it 'before', () ->

    kosher.alias 'Command'

    kosher.alias 'Domain', require 'a-cli-domain'

    kosher.alias 'stream', new kosher.WriteableStream

    kosher.alias 'instance', new kosher.Domain

      consoleOutputStream: kosher.stream

      consoleErrorStream: kosher.stream

    kosher.instance.use kosher.Command
