class RecordDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all
  decorates_finders

  def edit_link
    return unless record.editable?(current_user)
    link_to('Edit',
        edit_record_path(record),
        class: 'uk-icon-link', 'uk-icon': 'icon: pencil')
  end

  def destroy_link
    return unless record.editable?(current_user)
    link_to('Destroy',
        record, method: :delete,
        data: { confirm: 'Are you sure?' },
        class: 'uk-icon-link', 'uk-icon': 'icon: trash')
  end

  def compact_name
    "#{record.user.name} - #{record.issue.name}"
  end

  def user_select(f, users)
    if users.size == 1
      f.hidden_field(:user_id, value: users.first.id) +
        content_tag(:div, users.first.name, class: 'uk-input uk-disabled')
    else
      options = h.options_from_collection_for_select(users, :id, :name, record.user_id)
      f.select :user_id,  options, {}, {class: 'uk-select'}
    end
  end
end