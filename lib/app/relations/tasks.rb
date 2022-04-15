module App
  module Relations
    class Tasks < ROM::Relation[:sql]
      # This gets all
      schema(:tasks, infer: true) do
        associations do
          belongs_to :user
        end
      end

      def for_users(_assoc, users)
        restrict(user_id: users.map { |u| u[:id] })
      end
    end
  end
end
