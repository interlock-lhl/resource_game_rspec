class Resource

  class Base
    attr_accessor :count

    def initialize(count)
      @count = count
    end

    def name
      :Base
    end
  end

  class Coal < Base

    def burn
      self.count -= 1
    end

    def name
      :Coal
    end
  end

  class Sand < Base
    def name
      :Sand
    end
  end
end
