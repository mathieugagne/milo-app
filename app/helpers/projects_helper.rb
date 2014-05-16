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

  def project_user_list project
    avatar_list = project.users.map{|u| avatar_image_tag(u)}
    avatar_list.any? ? project_user_list_tag(avatar_list) : empty_list_tag
  end

  private

  def project_user_list_tag(avatar_list)
    content_tag(:ul, avatar_list.join.html_safe, class: 'list-inline')
  end

  def empty_list_tag
    content_tag(:span, 'None assigned.', class: 'text-muted')
  end

  def avatar_image_tag user
    content_tag(:li, image_tag(user.avatar_url(:thumb), alt: user.email))
  end

end
