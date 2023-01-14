local status, mason = pcall(require, "mason")
if not status then
  print("mason is not installed")
end


mason.setup{}
