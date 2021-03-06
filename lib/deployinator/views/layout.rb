require 'deployinator/helpers/git'
require 'deployinator/helpers/stack-tail'
require 'mustache/sinatra'
require 'deployinator/helpers/version'

module Deployinator
  module Views
    class Layout < Mustache
      include Deployinator::Helpers::GitHelpers, 
        Deployinator::Helpers::StackTailHelpers,
        Deployinator::Helpers::VersionHelpers

      @@internal_partials = ["log", "log_table", "generic_single_push", "scroll_control", "messageboxes"]

      self.template_file = "#{File.dirname(__FILE__)}/../templates/layout.mustache"

      def self.partial(name)
        if @@internal_partials.include?(name.to_s)
          File.read("#{File.dirname(__FILE__)}/../templates/#{name.to_s}.mustache")
        else
          super
        end
      end

      def push_order
        %w[production]
      end

      def set_stack(stack)
        @stack = stack
      end

      def disabled_override
        @disabled_override
      end

      def additional_bottom_body_html
        ""
      end

      def additional_top_body_html
        ""
      end

      def additional_header_html
        ""
      end

      def tailer_loading_message
        "Currently connecting to tailer web socket. If this message persists for a long time, please contact your administrator. If you are developing a new stack, try restarting the deployinator-tailer."
      end
    end
  end
end
