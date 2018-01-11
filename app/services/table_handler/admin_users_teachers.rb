module TableHandler
  class AdminUsersTeachers < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :admin_users_teachers, :columns)
      @per_page = config.dig(:tables, :admin_users_teachers, :per_page)
    end

    def available_columns
      [
        { name: :iin, type: :iin, align: :center },
        { name: :email, type: :email, align: :left },
        { name: :last_name, type: :string, align: :left },
        { name: :first_name, type: :string, align: :left },
        { name: :middle_name, type: :string, align: :left },
        { name: :date_of_birth, type: :date, align: :center },
        { name: :teacher_profile_created_at, type: :datetime, align: :center },
        { name: :teacher_profile_date_of_admission, type: :date, align: :center }
      ]
    end

    def default_columns
      [
        { name: :iin, type: :iin, align: :center },
        { name: :last_name, type: :string, align: :left },
        { name: :first_name, type: :string, align: :left },
        { name: :middle_name, type: :string, align: :left },
        { name: :date_of_birth, type: :date, align: :center },
        { name: :teacher_profile_created_at, type: :datetime, align: :center },
        { name: :teacher_profile_date_of_admission, type: :date, align: :center }
      ]
    end
  end
end