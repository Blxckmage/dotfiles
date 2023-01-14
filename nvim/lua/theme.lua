local status, gruvbox = pcall(require, "gruvbox")
if not status then
  return
end

gruvbox.setup({
  transparent_mode = true,
  contrast = "soft",
})

vim.cmd("colorscheme gruvbox")
