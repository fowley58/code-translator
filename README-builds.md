# AI Code Translator builds

Version: 1.0.1

This project is prepared for both Windows and Linux builds.

## Windows

Run in PowerShell:

```powershell
./build-windows.ps1
```

This compiles the application with the Windows GUI subsystem and produces:

- `AI-Code-Translator-1.0.1.exe`

## Linux

Run in bash:

```bash
chmod +x build-linux.sh
./build-linux.sh
```

This compiles the app and produces:

- `AI-Code-Translator-1.0.1`

## Notes

- Windows build uses MSYS2 UCRT64 GCC.
- Linux build uses pkg-config and raylib development libraries.
- The app still expects the translator backend server to be reachable at the configured URL/host.
