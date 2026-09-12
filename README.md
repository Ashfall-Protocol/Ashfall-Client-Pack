# Ashfall Protocol — Client Pack

Клиентская сборка для сервера Ashfall Protocol.

## Совместимость

- Minecraft `1.20.1`
- Forge `47.4.23`
- 79 клиентских модов
- Ресурспак `Ashfall-Resource-Pack`

## Установка

1. Установите Minecraft Forge `47.4.23` для Minecraft `1.20.1`.
2. Скачайте содержимое папки [`mods`](./mods) и поместите `.jar`-файлы в папку `mods` вашей инстанции.
3. Скопируйте [`resourcepacks/Ashfall-Resource-Pack`](./resourcepacks/Ashfall-Resource-Pack) в папку `resourcepacks`.
4. Включите ресурспак в настройках Minecraft.
5. Подключитесь к серверу Ashfall Protocol.

## Состав

- `mods/` — клиентские и общие моды сборки.
- `resourcepacks/Ashfall-Resource-Pack/` — ресурспак Ashfall Protocol.
- [`client-manifest.json`](./client-manifest.json) — манифест SHA-256 для проверки состава модов и будущего автообновления через AshfallGuard.

Серверные скрипты, серверные конфигурации, proxy-секреты и другие приватные файлы в этот репозиторий не публикуются.

## Проверка файлов

Для каждого JAR в манифесте указаны размер и SHA-256. Если файл изменён или повреждён, его хэш не совпадёт с `client-manifest.json`.

## Обновления

Релизы публикуются в этом репозитории. Автообновление через AshfallGuard будет включено после публикации подписанного манифеста и настройки публичного ключа в клиентской сборке.
