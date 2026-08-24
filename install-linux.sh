#!/usr/bin/env bash
set -euo pipefail

VERSION="1.0.1"
APP_NAME="AI Code Translator"
APP_BIN="AI-Code-Translator-${VERSION}"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="/opt/AI-Code-Translator"
DESKTOP_FILE="${HOME}/Desktop/${APP_NAME}.desktop"

if [[ ! -f "${SOURCE_DIR}/${APP_BIN}" ]]; then
  echo "Missing binary: ${SOURCE_DIR}/${APP_BIN}"
  echo "Build it first by running: ./build-linux.sh"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "This installer needs root permissions to place the app into /opt."
  echo "Please run with sudo:"
  echo "  sudo bash install-linux.sh"
  exit 1
fi

mkdir -p "${INSTALL_DIR}"
install -m 0755 "${SOURCE_DIR}/${APP_BIN}" "${INSTALL_DIR}/${APP_BIN}"

cat > /usr/share/applications/AI-Code-Translator.desktop <<EOF
[Desktop Entry]
Version=${VERSION}
Type=Application
Name=${APP_NAME}
Comment=AI code translator app
Exec=${INSTALL_DIR}/${APP_BIN}
Icon=utilities-terminal
Terminal=false
Categories=Utility;Development;
EOF

chmod 0644 /usr/share/applications/AI-Code-Translator.desktop

if [[ -d "${HOME}/Desktop" ]]; then
  cp /usr/share/applications/AI-Code-Translator.desktop "${DESKTOP_FILE}"
  chmod 0755 "${DESKTOP_FILE}"
fi

echo "Installed ${APP_NAME} version ${VERSION}"
echo "Binary: ${INSTALL_DIR}/${APP_BIN}"
echo "Launcher: /usr/share/applications/AI-Code-Translator.desktop"
