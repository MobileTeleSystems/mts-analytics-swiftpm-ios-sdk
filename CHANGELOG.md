# Changelog

## v.5.1.4 - Jun 13, 2025

### Fixed
- Исправлена проблема потенциального deadlock при обращении к db с разных потоков
- Исправлена работа трекинга запросов в Performance модуле, который мог блокировать запрос сторонних SDK

## v.5.1.3 - Jun 9, 2025

### Fixed
- Исправлена проблема с падением SDK при блокировании db

## v.5.1.2 - May 30, 2025

### Fixed
- Исправлена проблема с установкой SDK через cocoapods

## v.5.1.1 - May 30, 2025

### Fixed
- Исправлены баги и ошибки

## v.5.1.0 - May 29, 2025

### Added
- Добавлена версия MTAnalytics в формате Static Framework
- Добавлен функционал Perfomance
- Добавлено новое публичное свойство allValues в Remote Config

### Fixed
- Исправлен data race в SQLite

## v.5.0.0 - April 2, 2025

### Changed

- Breaking: MTMetricsConfiguration переименован на MTAnalyticsConfiguration
- Breaking: MTMetricsApp переименован на MTAnalyticsApp
- Breaking: метод resolveLink перенесен в linkResolver
- Breaking: sdkVersion and sdkBuildNumber перенесены в MTAnalyticsApp
- Обновлена структура лог сообщений

### Added
- Добавлены async track методы

## v.4.1.0 - February 11, 2025

### Added
- Добавлено проперти для получения sdkBuildNumber

### Fixed
- Исправлена работа log сообщений

## v.4.0.0 - February 5, 2025

### Changed
- Breaking: MTAnalyticsConfiguration переименован на MTMetricsConfiguration
- Breaking: MTAnalyticsProvider переименован на MTAnalytics

### Added
- Добавлен новый способ конфигурировать SDK, используя класс MTMetricsApp
- Добавлен функционал Remote Config
- Добавлено проперти для получения sdkVersion
- Добавлен новый алгоритм вычисления hit_id
- Добавлено экосистемное поле MtsIDAuthState
- Добавлено название модуля откуда логгируется сообщение

### Removed
- Breaking: Удалена возможность передавать кастомный тип события в MTCustomEvent

## v.3.2.0 - December 5, 2024

### Added
- Добавлена валидация flowId для Debug сборки
- Максимальное количество символов для MTEcosystemEvent увеличен с 100 до 200

### Fixed
- Исправлены баги и улучшена общая стабильность

## v.3.1.0 - October 11, 2024

### Added
- Добавлен публичный метод resolveLink для получения параметров при переходе на universal link
- Лимит количества символов для поля eventName увеличен с 100 до 500
- Добавлен публичный метод trackViewDidAppear для отслеживания скорости загрузки экрана

### Fixed
- Исправлены баги и улучшена общая стабильность

## v.3.0.0 - September 12, 2024

### Changed
- Breaking: Деперсонализация SDK для МТС Банка

### Fixed
- Исправлены баги и улучшена общая стабильность

## v.2.5.3 - August 12, 2024

### Changed
- Обновлена версия swift protobuf для установки через SPM

## v.2.5.2 - August 8, 2024

### Added
- Добавлены новые шаблоны события для работы с ECommerce
- Добавлено шаблон события для работы с deeplinks

## v.2.4.0 - June 20, 2024

### Added
- Добавлен Privacy Manifest

### Fixed
- Исправлены баги и улучшена общая стабильность

## v.2.3.0 - June 10, 2024

### Fixed
- Исправлены баги и улучшена общая стабильность

## v.2.2.2 - May 23, 2024

### Fixed
- Исправлены баги и улучшена общая стабильность

## v.2.2.1 - May 23, 2024

### Added
- Реализована поддержка SDK на tvOS с минимальной версией 13.0

## v.2.1.0 - April 15, 2024

### Changed
- Breaking: Минимально необходимая версия iOS поднята до 13.0

### Fixed
- Исправлено предупреждение, связанное с лицензией, возникающее при установке SDK
- Исправлена ошибка парсинга null значений, при передаче таких значений из приложений на flutter

## v.2.0.0 - March 22, 2024

### Fixed
- Исправлено дублирование параметров event и event_type для экосистемного ивента
