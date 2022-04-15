module App
  class Repository < ROM::Repository::Root
    include Import["container"]

    struct_namespace App::Entities
  end
end
