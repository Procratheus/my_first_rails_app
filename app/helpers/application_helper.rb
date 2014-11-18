module ApplicationHelper

  def form_group_tag(errors)
    if errors.any?
      class_tag_error = "form-group has-error"
    else
      class_tag_error = "form-group"
    end
  end

end
