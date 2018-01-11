module TableHandler
  class BaseClass

    def available_columns
      raise NotImplementedError
    end

    def columns
      @columns || default_columns
    end

    def per_page
      @per_page || default_per_page
    end

    def default_columns
      []
    end

    def default_per_page
      50
    end
  end
end
