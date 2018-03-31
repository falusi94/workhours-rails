class IssueDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all
  decorates_finders

  def edit_link
    return unless current_user.admin?
    link_to('Edit',
        edit_issue_path(issue),
        class: 'uk-icon-link', 'uk-icon': 'icon: pencil')
  end

  def destroy_link
    return unless current_user.admin?
    link_to('Destroy',
        issue, method: :delete,
        data: { confirm: 'Are you sure?' },
        class: 'uk-icon-link', 'uk-icon': 'icon: trash')
  end

  def compact_name
    "#{issue.name} (#{issue.project.name})"
  end
end
