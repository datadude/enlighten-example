module ApplicationHelper

  def dl_row(title,definition)
    render partial: 'shared/dl_row', locals: {title: title, definition: definition}
  end

  def page_link (display, alternate, controller,action, options={})
      link_to_unless_current( display,{controller: controller, action: action},options.reverse_merge(class: controller.to_s + '_' + action.to_s + '_link')){|name|alternate||display}
  end


end
