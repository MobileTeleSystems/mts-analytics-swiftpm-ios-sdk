# MTS Analytics iOS

Документация [здесь](https://a.mts.ru/support/analytics-software/app-sdk-setup/ios-sdk/)

- [Подключение SDK](#goto_add_dependencies)
- [Инициализация](#goto_initialization)
- [Отправка события](#goto_send_events)
- [Конфигурация](#goto_configuration)
- [Сборка проекта](#goto_build_project)

### Актуальная версия MTSAnalytics - 2.3.0

## Требования для установки SDK

- iOS 13.0+
- tvOS 13.0+

- Необходим ID потока, который на данном этапе выдается по запросу.

## <a name="goto_add_dependencies">Шаг 1. Подключение SDK</a>

### Swift Package Manager
1. Открыть Xcode project, выбрать вкладку File → Add Packages
2. В поле поиска добавить URL проекта и нажать Add Package
```
https://github.com/MobileTeleSystems/mts-analytics-swiftpm-ios-sdk/
```

### Cocoapods
1. Чтобы добавить библиотеку MTSAnalytics в проект, через CocoaPods добавьте в Podfile:
```ruby
pod 'MTSAnalytics',  '~> 2.3.0'
```

2. Устанавливаем ссылку на библиотеку MTSAnalytics в Podfile: 
```ruby
source 'https://github.com/MobileTeleSystems/mts-analytics-podspecs'
```
3. Сохраните Podfile и введите pod install в Терминале для установки библиотеки.

## <a name="goto_initialization">Шаг 2. Инициализация SDK</a>
1.  Для импорта библиотеки добавьте в проект:
```swift
import MTSAnalytics
```
2.  Создайте экземпляр MTAnalyticsProvider:
```swift
var mtsAnalytics: MTAnalyticsProvider?
```
3. Для создания начальной конфигурации добавьте ID потока данных в flowId = "…": 
```swift
let configuration = MTAnalyticsConfiguration(flowId: "FLOW_ID")
```
4. Для завершения инициализации MTSAnalytics добавьте конфигуратор:
```swift
mtsAnalytics = MTAnalytics.getInstance(configuration: configuration)
```

## <a name="goto_send_events">Шаг 3. Отправка события</a>
Для настройки обмена данными между устройством iOS и МТС Аналитикой создайте экземпляр события и запустите его отправку.

### Создать экземпляр события:
Можно использовать custom event, где можно задать .event, .screenView или свое собственное название типа ивента через .custom("any_name")
```swift
let event = MTCustomEvent(eventType: .event, eventName: "button_tap", screenName: "Login", parameters: ["test": "123"])
```
Либо использовать свой собственный шаблон используя MTEventRepresentable протокол.

### Настроить отправку экземпляра события в МТС Аналитику:
```swift
mtsAnalytics?.track(event: event)
```

### Так же можно отправлять event и его дополнительные атрибуты без использования шаблонов
```swift
mtsAnalytics?.track(eventName: "button_tap", parameters: ["test": "123"])
```

### Создать экземпляр ошибок:
```swift
let error = MTError(errorName: "failed request", parameters: ["test": "123"])
```
Так же можно передать stacktrace symbols в stacktrace экземпляра ошибки в виде массива строк
(На данный момент сборка ошибок не функционирует)


### Кросс-платформенное отслеживание
Для авторизации сессии через webView используйте WebSSO state, который можно получить из WebSSO SDK.
```swift
mtsAnalytics?.sendAuthenticationEvent(ssoState: "...", redirectUrl: "https://mts.ru")
```
Для передачи значения вызовите метод и передайте ранее полученный ssoState в формате String.
Для определения сессии юзера в случае перехода в webView или внешний браузер через приложение в котором активирован MTAnalytics, при формировании запроса для webView или браузер требуется добавить webSessionQueryItem в url запроса в виде URLQueryItem.
```swift
let queryItem = mtsAnalytics?.webSessionQueryItem(url: "https://mts.ru")
```

### Передача данных о геолокации
```swift
mtsAnalytics?.setLocation(CLLocation(latitude: latitude, longitude: longitude))
```

### Обновление конфигурации без повторной инициализации
```swift
mtsAnalytics?.update(with: configuration)
```

## <a name="goto_configuration">Конфигурация SDK</a>

### Инициализация конфигурации
```swift
let configuration = MTAnalyticsConfiguration(flowId: "FLOW_ID")
```

### Сбор краш метрик
```swift
configuration.crashReportingEnabled = false
```
По умолчанию, сборка краш метрик включена.

### Настройки сессии
Чтобы настроить время автоматического завершения фоновой (backgroundTimeout) и активной сессии (activeTimeout), добавьте:
```swift
configuration.activeTimeout = 1800
configuration.backgroundTimeout = 1800
```
По умолчанию для обоих режимов значение составляет 1800 секунд (30 минут). Минимальное допустимое значение - 900 (15 минут), максимальное - 86400 (24 часа).

### Аккумуляция событий в хранилищ
```swift
configuration.eventStorageLimit = 20000
```
Определяет максимальное количество событий, которые будут храниться на девайсе до тех пора пока не будут отправлены. Поступающие новые события будут вытеснять наиболее старые, тем самым соблюдать ограничение в рамках установленного лимита.
По умолчанию максимальное количество составляет 20000 событий и является максимальным допустимым значением. Минимальное количество событий составляет 3000.

### Настройка роуминга
```swift
configuration.networkTraffic = .on
```
Дает возможность остановить отправку событий. По умолчанию отправка событий включена.


### Для запуска MTAnalytics требуется передать конфигурацию
```swift
mtsAnalytics = MTAnalytics.getInstance(configuration: configuration)
```

## <a name="goto_build_project">Сборка проекта</a>

### set env

```bash
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export CP_HOME_DIR=".cocoapods"
export BUNDLE_PATH="vendor"

. ./set-env.sh
```

### установка ruby пакетов (кристаликов)

```bash
bundle install
```

### запуск fastlane

```bash
bundle exec fastlane mr --verbose
```



