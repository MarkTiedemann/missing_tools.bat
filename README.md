# missing_tools.bat

[![Build Status](https://dev.azure.com/mark-tiedemann/missing_tools.bat/_apis/build/status/MarkTiedemann.missing_tools.bat)](https://dev.azure.com/mark-tiedemann/missing_tools.bat/_build)

**A Windows Batch script to performantly determine missing tools.**

```batch
> missing_tools.bat a.exe b.exe c.exe d.exe e.exe f.exe
b.exe, c.exe, and e.exe
```

## Makefile Example

```makefile
# Makefile
required_tools := a.exe b.exe c.exe d.exe e.exe f.exe
missing_tools := $(shell missing_tools.bat $(required_tools))
$(if $(missing_tools),$(error $(missing_tools) must be installed first),)
```

```batch
> make
makefile:4: *** a.exe, b.exe, and c.exe must be installed first.  Stop.
```

## Development

```batch
powershell -f test.ps1
```

## License

MIT
