module TableHandler
  class AdminUsersIndex < BaseClass
    def initialize(config)
      @columns = config.dig(:tables, :admin_users_index, :columns)
      @per_page = config.dig(:tables, :admin_users_index, :per_page)
    end

    def available_columns
      [
        { name: :iin, type: :iin, align: :center },
        { name: :email, type: :email, align: :left },
        { name: :last_name, type: :string, align: :left },
        { name: :first_name, type: :string, align: :left },
        { name: :middle_name, type: :string, align: :left },
        { name: :date_of_birth, type: :date, align: :center }
      ]
    end

    def default_columns
      [
        { name: :iin, type: :iin, align: :center },
        { name: :last_name, type: :string, align: :left },
        { name: :first_name, type: :string, align: :left },
        { name: :middle_name, type: :string, align: :left },
        { name: :date_of_birth, type: :date, align: :center }
      ]
    end
  end
end