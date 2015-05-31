module NgosHelper

  def add_notifier_fields(content)
    p "in add_notifier_fields in helper"
    p content
    fields = content
    link_to( raw("<i class='fa fa-plus'></i>&nbsp;Add Notifier"), "javascript:void(0)", :onclick => h("add_notifier_fields(this, \"#{escape_javascript(fields)}\")"), :class => "btn btn-primary")
  end

end
