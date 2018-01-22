module TableHandler
  class AdminJournalsIndex < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :admin_journals_index, :columns)
      @per_page = config.dig(:tables, :admin_journals_index, :per_page)
    end

    def available_columns
      [
        { name: :subject_title, type: :string, align: :left },
        { name: :academic_period_title, type: :string, align: :center },
        { name: :journable_full_title, type: :string, align: :center }
      ]
    end

    def default_columns
      [
        { name: :subject_title, type: :string, align: :left },
        { name: :academic_period_title, type: :string, align: :center },
        { name: :journable_full_title, type: :string, align: :center }
      ]
    end
  end
end