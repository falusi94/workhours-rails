class ProjectDecorator < Draper::Decorator
  include Draper::LazyHelpers
  decorates_association :issue
  delegate_all
  decorates_finders

  def edit_link
    return unless current_user.admin?
    link_to('',
        edit_project_path(project),
        class: 'uk-icon-link', 'uk-icon': 'icon: pencil')
  end

  def destroy_link
    return unless current_user.admin?
    link_to('',
        project, method: :delete,
        data: { confirm: 'Are you sure?' },
        class: 'uk-icon-link', 'uk-icon': 'icon: trash')
  end

  def progress
    if project.issue
      max = project.issue.count
      value = finished_issues(project.issue).count
    else
      max = 0
      value = 0
    end
    content_tag(:progress, '', class: 'uk-progress uk-margin-remove',
      max: max, value: value)
  end

  def issues_tag
    return if issue.count == 0
    content_tag(:h3, 'Issues', class: 'uk-h3')
  end
end
