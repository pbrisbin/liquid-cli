require 'json'
require 'liquid'
require 'liquid/cli/version'

module Liquid
  class Cli
    def initialize(json_context)
      @context = JSON.parse(json_context)
    end

    def render(input)
      Template.parse(input).render(context)
    end

    private

    attr_reader :context
  end
end
