module App
  module Repos
    class UserRepo < App::Repository[:users]
      include Import["app.repos.task_repo"]

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
        users.transaction do
          task_attrs = user[:tasks]
          user = users.changeset(:create, user).map(:add_timestamps).commit

          # It does not set the timestamps
          # https://www.rubydoc.info/github/rom-rb/rom-sql/ROM/SQL/Relation
          # https://www.rubydoc.info/github/rom-rb/rom-sql/ROM/SQL/Relation#multi_insert-instance_method
          new_tasks = tasks.multi_insert(task_attrs.map do |task|
            task.merge!(
              user_id: user.id,
              created_at: Time.now,
              updated_at: Time.now
            )
          end)
        end

        get_by_id(user.id).combine(:tasks).one
      end

      def last_user
        users.reverse(:id).combine(:tasks).limit(1).one
      end

      def find_with_completed_task(id)
        users.by_pk(id).combine(:tasks).node(:tasks) do |tasks|
          tasks.exclude(completed_at: nil)
        end.one
      end
    end
  end
end
