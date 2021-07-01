module EventAttendancesHelper
    def event_form(current_event, event_attendance)
      form_with(model: event_attendance) do |form|
        content_tag(:div, class: 'main_form') do
          form.hidden_field :attended_event_id, value: current_event.id
        end
        content_tag(:div, class: 'actions') do
          form.submit 'attend this event'
        end
      end
    end
end
