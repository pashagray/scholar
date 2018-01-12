module TableHandler
  class AdminStudyGroupsIndex < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :admin_study_groups_index, :columns)
      @per_page = config.dig(:tables, :admin_study_groups_index, :per_page)
    end

    def available_columns
      [
        { name: :level, type: :string, align: :left },
        { name: :title, type: :string, align: :left },
        { name: :students_count, type: :string, align: :right }
      ]
    end

    def default_columns
      [
        { name: :level, type: :string, align: :left },
        { name: :title, type: :string, align: :left },
        { name: :students_count, type: :string, align: :right }
      ]
    end
  end
end