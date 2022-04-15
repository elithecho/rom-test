Application.register_provider(:persistence) do
  start do
    config = target["db"]
    config.auto_registration(target.root + "lib/app")

    container = ROM.container(target["db"]) do |config|
      config.gateways[:default].use_logger(Logger.new($stdout))
    end

    register("container", container)
  end
end
