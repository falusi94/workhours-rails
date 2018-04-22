class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  decorates_association :record
  delegate_all
  decorates_finders

  def edit_link
    return unless user.editable?(current_user)
    link_to('',
        edit_user_path(user),
        class: 'uk-icon-link', 'uk-icon': 'icon: pencil')
  end

  def destroy_link
    return unless current_user.admin?
    link_to('',
        user, method: :delete,
        data: { confirm: 'Are you sure?' },
        class: 'uk-icon-link', 'uk-icon': 'icon: trash')
  end

  def username_tag
    return unless current_user.admin?
    content_tag(:p, content_tag(:strong, 'Username: ') + user.username)
  end

  def admin_tag
    return unless current_user.admin?
    content_tag(:p, content_tag(:strong, 'Admin: ') + user.admin)
  end

  def edit_admin_tag(f)
    return unless current_user.admin?
    check_box = f.check_box(:admin, class: 'uk-checkbox')
    label = f.label(:admin, class: 'uk-form-label')
    tag = content_tag(:div, check_box, class:'uk-form-controls')
    content_tag(:div, label + tag)
  end

  def records_tag
    return if record.count == 0
    content_tag(:h3, 'Records', class: 'uk-h3')
  end
end
