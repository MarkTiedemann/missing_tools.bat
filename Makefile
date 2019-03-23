required_tools := a.exe b.exe c.exe d.exe e.exe f.exe
missing_tools := $(shell missing_tools.bat $(required_tools))
$(if $(missing_tools),$(error $(missing_tools) must be installed),)
