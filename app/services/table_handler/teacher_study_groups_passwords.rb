module TableHandler
  class TeacherStudyGroupsPasswords < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :teacher_study_groups_passwords, :columns)
      @per_page = config.dig(:tables, :teacher_study_groups_passwords, :per_page)
    end

    def available_columns
      [
        { name: :iin, type: :iin, align: :center },
        { name: :last_name, type: :string, align: :left },
        { name: :first_name, type: :string, align: :left },
        { name: :middle_name, type: :string, align: :left },
        { name: :temp_password, type: :string, align: :center },
      ]
    end

    def default_columns
      [
        { name: :iin, type: :iin, align: :center },
        { name: :last_name, type: :string, align: :left },
        { name: :first_name, type: :string, align: :left },
        { name: :middle_name, type: :string, align: :left },
        { name: :temp_password, type: :string, align: :center },
      ]
    end
  end
end