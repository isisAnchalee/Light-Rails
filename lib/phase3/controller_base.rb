require_relative '../phase2/controller_base'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      template_string = File.read("views/#{self.class.to_s.underscore}/#{template_name}.html.erb")
      e = ERB.new(template_string)
      
      render_content(e.result(binding), "text/html")
    end
  end
end
