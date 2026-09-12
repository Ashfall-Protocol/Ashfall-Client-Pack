# Ashfall Protocol — Client Pack

## English

Ashfall Protocol is a Minecraft Java Edition 1.20.1 client pack for Forge
47.4.23.

### Download and install

Download the latest asset from the [Releases](https://github.com/Ashfall-Protocol/Ashfall-Client-Pack/releases/latest)
page: `Ashfall-Protocol-Client-<version>.zip`.

In Prism Launcher, choose **Add Instance → Import from zip**, select the
archive, and launch the imported instance. Manual installation is also
possible: copy the archive's `minecraft` directory contents into a Forge
1.20.1 instance.

### Included

- 79 tested Forge mods;
- Ashfall resource pack;
- TacZ default gunpack assets;
- tested client configs, key bindings, video/audio settings, and UI settings;
- portable Prism metadata for importing the instance.

Personal and server-side state is intentionally excluded: server lists,
worlds, maps, waypoints, logs, caches, account data, server scripts, proxy
secrets, XRay packs, and the CheatUtils test mod.

### Integrity and automatic updates

AshfallGuard verifies a signed SHA-256 manifest from this repository at client
startup. When a mod is missing or changed, the updater downloads the verified
JAR into a staging directory and applies it after Minecraft exits. JARs that
are no longer present in the manifest are removed on that restart.

The updater manages mod JARs only. Changes to configs or the resource pack are
distributed through a new full client release.

### Maintainer: release a mod update

1. Replace the required JAR in the clean `client/mods` directory.
2. Verify that the same compatible version is installed on the server when the
   mod is common or server-side.
3. Run `tools/release/Publish-ClientRelease.ps1` with a new version, for
   example `2026.09.13`.
4. The script synchronizes the public mod mirror, regenerates and signs the
   manifest, builds the client archive, pushes the repository, and creates the
   GitHub Release.
5. Players restart Minecraft. AshfallGuard applies the update before the next
   connection attempt.

To remove a mod for everyone, delete its JAR from `client/mods` before the
release. The signed manifest will no longer list it and the updater will remove
it from clients.

Never commit the Ed25519 private signing key. Keep an offline backup; losing it
requires shipping a new client build with a new public key.

Third-party mods remain subject to their authors' licenses and distribution
rules.

## Русский

Ashfall Protocol — клиентская сборка Minecraft Java Edition 1.20.1 для Forge
47.4.23.

### Скачать и установить

Скачайте последний архив на странице [Releases](https://github.com/Ashfall-Protocol/Ashfall-Client-Pack/releases/latest):
`Ashfall-Protocol-Client-<версия>.zip`.

В Prism Launcher выберите **Добавить инстанс → Импортировать из zip**, укажите
архив и запустите импортированный инстанс. Вручную можно скопировать содержимое
папки `minecraft` из архива в инстанс Forge 1.20.1.

### Что входит

- 79 проверенных Forge-модов;
- ресурспак Ashfall;
- стандартные ассеты gunpack для TacZ;
- проверенные конфиги клиента, бинды, видео-, аудио- и UI-настройки;
- переносимые метаданные Prism для импорта инстанса.

Личные и серверные данные намеренно исключены: список серверов, миры, карты,
вейпоинты, логи, кэши, данные аккаунта, серверные скрипты, секреты прокси,
XRay-ресурспаки и тестовый мод CheatUtils.

### Целостность и автообновление

AshfallGuard при запуске клиента проверяет подписанный SHA-256 manifest из этого
репозитория. Если мод отсутствует или изменён, updater скачивает проверенный JAR
во временное хранилище и применяет его после закрытия Minecraft. Моды, которых
больше нет в manifest, удаляются при том же перезапуске.

Updater управляет только JAR-файлами модов. Изменения конфигов или ресурспака
выпускаются отдельным полным клиентским релизом.

### Для владельца: как обновить пару модов у всех

1. Замени нужный JAR в чистой папке `client/mods`.
2. Проверь, что совместимая версия установлена на сервере, если мод общий или
   серверный.
3. Запусти `tools/release/Publish-ClientRelease.ps1` с новой версией, например
   `2026.09.13`.
4. Скрипт обновит публичную копию модов, пересоздаст и подпишет manifest,
   соберёт клиентский архив, отправит изменения в GitHub и создаст Release.
5. Игрокам достаточно перезапустить Minecraft. AshfallGuard обновит сборку до
   следующего подключения к серверу.

Чтобы удалить мод у всех, удали его JAR из `client/mods` перед релизом. В
подписанном manifest его больше не будет, и updater удалит мод у игроков.

Никогда не добавляй приватный Ed25519-ключ подписи в Git. Храни его отдельно и
сделай резервную копию: при потере ключа придётся выпускать клиент с новым
публичным ключом.

Сторонние моды распространяются только в соответствии с лицензиями и правилами
их авторов.
