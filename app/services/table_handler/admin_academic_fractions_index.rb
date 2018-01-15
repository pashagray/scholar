module TableHandler
  class AdminAcademicFractionsIndex < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :admin_academic_fractions_index, :columns)
      @per_page = config.dig(:tables, :admin_academic_fractions_index, :per_page)
    end

    def available_columns
      [
        { name: :title, type: :string, align: :left },
        { name: :starts_on, type: :date, align: :center },
        { name: :ends_on, type: :date, align: :center }
      ]
    end

    def default_columns
      [
        { name: :title, type: :string, align: :left },
        { name: :starts_on, type: :date, align: :center },
        { name: :ends_on, type: :date, align: :center }
      ]
    end
  end
end