module SelectHelper

  def select_subject
    Subject.order(:title).map { |s| [s.title, s.id] }
  end

  def select_teacher
    User.teachers.alphabetical_order.map { |s| [s.full_name, s.id] }
  end

  def select_grading_system
    Setting.available_grading_systems.map { |elem| [t("common.grading_systems.#{elem}"), elem] }
  end
end