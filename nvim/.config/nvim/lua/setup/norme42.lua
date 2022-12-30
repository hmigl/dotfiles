local status_ok, norme = pcall(require, 'norme')
if not status_ok then
  return
end

norme.setup()
