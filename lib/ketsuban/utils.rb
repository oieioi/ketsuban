module Ketsuban
  module Utils
    module_function

    def includenize!(func)
      func.instance_eval do
        def include?(next_id)
          call(next_id)
        end
      end
      func
    end
  end
end
