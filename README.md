# Мой Neovim config (LazyVim)

Личная конфигурация Neovim на базе [LazyVim](https://www.lazyvim.org/), настроенная под DevOps-задачи.

## Стек

- **Ansible** — LSP, автодополнение модулей и параметров
- **Go** — `gopls`, автодополнение, дебаг
- **Python** — `pyright`/`ruff`
- **YAML** (K8s manifests, Ansible) — `yaml-language-server` со схемами
- **Helm** — `helm-ls`, подсветка templates/values
- **Docker / docker-compose / Dockerfile** — LSP + линтинг
- **Bash** — `bashls` + `shellcheck`
- **Git** — `gitsigns`, интеграция с `lazygit`
- **Markdown** — превью, LSP

## Установка на новой машине

### 1. Установить Neovim (0.10+)

```bash
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
echo 'export PATH="/opt/nvim/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
rm nvim-linux-x86_64.tar.gz
nvim --version
```

Если стоит старая версия из apt — удалить: `sudo apt remove -y neovim`.

### 2. Системные зависимости

```bash
sudo apt update
sudo apt install -y git curl build-essential ripgrep fd-find python3-pip unzip
sudo ln -s $(which fdfind) /usr/local/bin/fd
```

Node.js должен быть установлен отдельно (нужен для части LSP-серверов).

### 3. lazygit (опционально, но рекомендуется)

```bash
sudo apt install -y lazygit
```

Если пакета нет в репозитории — установить из [официальных релизов](https://github.com/jesseduffield/lazygit/releases).

### 4. Развернуть этот конфиг

```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
git clone https://github.com/ВАШ_ЛОГИН/ВАШ_РЕПО.git ~/.config/nvim
nvim
```

При первом запуске LazyVim подтянет все плагины и LSP-серверы автоматически, версии зафиксированы в `lazy-lock.json`.

### 5. Проверка

Внутри Neovim:

```
:checkhealth
:Mason
```

Убедиться, что нет красных `ERROR` в критичных разделах, а в Mason установлены: `gopls`, `pyright`, `yaml-language-server`, `dockerfile-language-server`, `ansible-language-server`, `helm-ls`, `bash-language-server`, `shellcheck`.

## Иконки (Nerd Font)

Для корректного отображения иконок в Explorer и статусной строке — установить [Nerd Font](https://www.nerdfonts.com/font-downloads) (например, JetBrainsMono Nerd Font) и указать его в настройках терминала.

## Полезные ссылки

- [LazyVim документация](https://www.lazyvim.org/)
- `vimtutor` — встроенный интерактивный туториал по базовым командам Vim
