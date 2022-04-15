Application.register_provider(:persistence) do
  start do
    config = target["db"]
    config.auto_registration(target.root + "lib/app")

    register("container", ROM.container(target["db"]))
  end
end
