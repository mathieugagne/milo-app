module ProjectsHelper

  def project_status_label status
    status_class = case status
    when 'ongoing' then 'info'
    when 'completed' then 'success'
    when 'canceled' then 'warning'
    else
      'default'
    end
    content_tag(:span, status, class: "label label-#{status_class}")
  end

end
