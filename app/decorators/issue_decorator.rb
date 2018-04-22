class IssueDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all
  decorates_finders

  def edit_link
    return unless current_user.admin?
    link_to('',
        edit_issue_path(issue),
        class: 'uk-icon-link', 'uk-icon': 'icon: pencil')
  end

  def destroy_link
    return unless current_user.admin?
    link_to('',
        issue, method: :delete,
        data: { confirm: 'Are you sure?' },
        class: 'uk-icon-link', 'uk-icon': 'icon: trash')
  end

  def compact_name
    "#{issue.name} (#{issue.project.name})"
  end

  def success
    return unless issue.done?
    'uk-alert-success'
  end

  def records_tag
    return if record.count == 0
    content_tag(:h3, 'Records', class: 'uk-h3')
  end
end
