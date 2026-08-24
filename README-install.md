# Linux installer pro AI Code Translator

## 1) Sestavení aplikace

V Linuxu spusť:

```bash
chmod +x build-linux.sh
./build-linux.sh
```

Tím se vytvoří binární soubor:

```bash
AI-Code-Translator-1.0.1
```

## 2) Instalace

Z adresáře s instalačním skriptem spusť:

```bash
chmod +x install-linux.sh
sudo bash install-linux.sh
```

Instalátor:
- zkopíruje program do `/opt/AI-Code-Translator`
- vytvoří zástupce v aplikacích GNOME/KDE
- vytvoří ikonu na ploše, pokud existuje složka `~/Desktop`

## 3) Spuštění

Program lze spustit z menu aplikací nebo přímo:

```bash
/opt/AI-Code-Translator/AI-Code-Translator-1.0.1
```

## 4) Předpoklady

Na Ubuntu/Debian je potřeba:

```bash
sudo apt update
sudo apt install build-essential pkg-config libraylib-dev libcurl4-openssl-dev
```
