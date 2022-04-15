module App
  module Repos
    class UserRepo < App::Repository[:users]
      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: { timestamps: %i(created_at updated_at) }
        }

      def all
        users.to_a
      end

      def get_by_id(id)
        users.by_pk(id).combine(:tasks).one
      end

      def create_with_tasks(user)
        users.combine(:tasks).command(:create).call(user)
      end
    end
  end
end
