# frozen_string_literal: true

require 'parser'
require 'tempfile'
require 'vernacular'

require 'vernacular/ast/ast_parser'
require 'vernacular/ast/modifier'
require 'vernacular/ast/version'

require 'vernacular/ast/modifiers/typed_method_args'
require 'vernacular/ast/modifiers/typed_method_returns'

module Vernacular
  # Extends Vernacular to support rewriting the AST
  module AST
    PARSER_PATH = File.expand_path('ast/parser.rb', __dir__).freeze

    Vernacular::InstructionSequenceMixin.prepend(
      Module.new do
        def load_iseq(filepath)
          super unless filepath == PARSER_PATH
        end
      end
    )

    Vernacular::BootsnapMixin.prepend(
      Module.new do
        def input_to_storage(_content, filepath)
          if filepath == PARSER_PATH
            raise ::Bootsnap::CompileCache::Uncompilable, "can't compile parser"
          end

          super
        end
      end
    )
  end
end
