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

  def select_fraction_title
    JournalFraction::FRACTIONS.map { |f| [t("journal_fractions.FRACTIONS.#{f}"), f] }
  end

  def select_quarter_title
    JournalFraction::QUARTERS.map { |f| [t("journal_fractions.FRACTIONS.#{f}"), f] }
  end

  def select_cwday
    [1, 2, 3, 4, 5, 6, 7].map { |d| [t("schedule.weekdays.#{d.to_s}"), d]  } 
  end

  def select_time
    (7..20).map { |h| [h, (0..55).step(5).map { |m| ["%02d" % h, "%02d" % m].join(':') }] }
  end
end