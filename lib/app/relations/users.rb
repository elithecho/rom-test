module App
  module Relations
    class Users < ROM::Relation[:sql]
      # This gets all
      schema(:users, infer: true) do
        associations do
          has_many :tasks
        end
      end

      # This writes your own schema
      # ala - take only what you need
      # schema(:users) do
      #   attribute :first_name, Types::String
      # end
    end
  end
end
