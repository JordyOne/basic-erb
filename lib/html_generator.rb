require "erb_generator"

class HTMLGenerator < ERBGenerator
  def initialize(text=nil)
    @wrapper = text
  end


  def section(text)
    template = <<-TEMPLATE
<section><%= section_text %></section>
    TEMPLATE
    options_hash= {:locals => {:section_text => text},
                   :layout => @wrapper}
    erb(template, options_hash)
  end

  def unordered_list(text)
    template = <<-TEMPLATE
<ul>
<% list_each.each do |item|%>
<% item %>
<li><%= item %></li>
<%end%>
</ul>
    TEMPLATE
    options_hash = {:locals => {:list_each => text},
                    :layout => @wrapper}
    erb(template, options_hash)
  end

  def button(text, class_h = {})
    if class_h != {}
      template = "<button class='<%=class_hash[:class]%>'><%=button_text%></button>"
    else
      template = "<button><%=button_text%></button>"
    end
    options_hash = {:locals => {:button_text => text, :class_hash => class_h},
                    :layout => @wrapper}
    erb(template, options_hash)

  end
end


