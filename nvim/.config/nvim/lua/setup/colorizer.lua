local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	return
end

colorizer.setup({
	c = {
		names = false;
	};
	cpp = {
		names = false;
		RRGGBBAA = true;
	};
})
