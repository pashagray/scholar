class CreateLessons
  include Dry::Transaction

  step :find_journal
  step :prepare_fraction
  tee :persist

  def find_journal(input)
    journal = Journal.find_by_id(input[:journal_id])
    if journal
      Right(input.merge(journal: journal))
    else
      Left(:journal_not_found)
    end
  end

  def prepare_fraction(input)
    fraction = input[:journal].journal_fractions.find_by_title(input[:fraction])
    if fraction
      Right(input.merge(fraction: fraction))
    else
      fraction = input[:journal].journal_fractions.new(
        title: input[:fraction],
        starts_on: input[:journal].academic_period.send(input[:fraction].to_sym).first,
        ends_on: input[:journal].academic_period.send(input[:fraction].to_sym).last
      )
      puts input[:journal].academic_period.send(input[:fraction].to_sym).first
      puts input[:journal].academic_period.send(input[:fraction].to_sym).last
      puts fraction.inspect
      fraction.save!
      Right(input.merge(fraction_id: fraction.id))
    end
  end

  def persist(input)
    fraction = JournalFraction.find(input[:fraction_id])
    dates = (fraction.starts_on)..(fraction.ends_on)
    dates.group_by(&:wday)[input[:week_day].to_i].each do |date|
      fraction.lessons.create(
        day: date,
        starts_at: input[:starts_at],
        ends_at: input[:ends_at]
      )
    Right(true)
    end
  end
end
