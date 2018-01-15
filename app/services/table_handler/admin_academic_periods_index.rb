module TableHandler
  class AdminAcademicPeriodsIndex < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :admin_academic_periods_index, :columns)
      @per_page = config.dig(:tables, :admin_academic_periods_index, :per_page)
    end

    def available_columns
      [
        { name: :title, type: :string, align: :left },
        { name: :created_at, type: :date, align: :center }
      ]
    end

    def default_columns
      [
        { name: :title, type: :string, align: :left },
        { name: :created_at, type: :date, align: :center }
      ]
    end
  end
end