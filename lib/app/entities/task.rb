module App
  module Entities
    class Task < ROM::Struct
      def completed
        !completed_at.nil?
      end
    end
  end
end
