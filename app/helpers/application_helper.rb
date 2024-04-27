module ApplicationHelper
    def person_active(person)
        if person.active?
            content_tag(:span, class: "text-success") do
                content_tag(:i, '', class: "bi bi-check-circle")
            end
        else
            content_tag(:span, class: "text-danger") do
                content_tag(:i, '', class: "bi bi-x-circle")
            end
        end
    end

    def notice_present(notice)
        if notice.present?
            content_tag(:div, notice, class: "alert alert-success")
        end
    end
end