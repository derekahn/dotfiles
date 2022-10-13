local status_ok, illuminate = pcall(reload, "illuminate")
if not status_ok then
  return
end

illuminate.setup()
