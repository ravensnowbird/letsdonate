module TransportersHelper
  def add_region_fields(content)
     p "in add_region_fields in helper"
     p content
    fields = content
    link_to( raw("<i class='fa fa-plus'></i>&nbsp;Add Region"), "javascript:void(0)", :onclick => h("add_region_fields(this, \"#{escape_javascript(fields)}\")"), :class => "btn btn-primary")
  end


end
