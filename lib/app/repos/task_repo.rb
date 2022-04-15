module App
  module Repos
    class TaskRepo < App::Repository[:tasks]
      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: { timestamps: %i(created_at updated_at) }
        }

      def all
        tasks.to_a
      end
    end
  end
end

