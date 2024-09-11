# MTS Analytics iOS

Документация [confluence](https://confluence.mts.ru/pages/viewpage.action?pageId=311176873)

- [Подключение SDK](#goto_add_dependencies)
- [Инициализация](#goto_initialization)
- [Отправка события](#goto_send_events)
- [Конфигурация](#goto_configuration)
- [ECommerce события](#goto_ecommerce_feature)
- [Отслеживание deeplink](#goto_deeplink)

### Актуальная версия MTSAnalytics - 3.0.0

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
pod 'MTSAnalytics',  '~> 3.0.0'
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
## <a name="goto_ecommerce_feature">Отправка ECommerce событий</a>

МТС Аналитика предоставляет два вида шаблонов ECommerce событий: MTECommerceGA4 и MTECommerceUA.
Для отправки ECommerce событий используется метод

```swift
mtsAnalytics?.track(event: event)
```

### MTECommerceGA4Event
```swift
let event = MTECommerceGA4Event(
                                eventName: MTECommerceGA4EventName,
                                parameters: [String: Any?]?,
                                transactionId: String?,
                                affiliation: String?,
                                value: String?,
                                currency: String?,
                                tax: String?,
                                shipping: String?,
                                shippingTier: String?,
                                paymentType: String?,
                                coupon: String?,
                                itemListName: String?,
                                itemListId: String?,
                                items: [MTECommerceGA4EventItem]?,
                                creativeName: String?,
                                creativeSlot: String?,
                                promotionId: String?,
                                promotionName: String?
)
```

При выборе определенного кейса в **MTECommerceGA4EventName** в eventName, есть обязательные поля для корректной разметки.
##### add_payment_info
Пользователь выбрал способ оплаты.
Обязательные поля: массив MTECommerceGA4EventItem.
##### add_shipping_info
Пользователь выбрал способ доставки.
Обязательные поля: массив MTECommerceGA4EventItem.
##### add_to_cart
Пользователь добавляет товар в корзину из карточки товара или любых других товарных блоков.
Обязательные поля: массив MTECommerceGA4EventItem.
##### add_to_wishlist
Пользователь добавляет товар в избранное.
Обязательные поля: массив MTECommerceGA4EventItem.
##### begin_checkout
Пользователь переходит на страницу оформления заказа.
Обязательные поля: массив MTECommerceGA4EventItem.
##### purchase
Пользователь совершил покупку. Данное событие должно срабатывать только один раз для оформленного заказа.
Обязательные поля:
- transactionId.
- массив MTECommerceGA4EventItem.
##### refund
Пользователь возвращает покупку.
Обязательные поля:
- при полном возврате transactionId.
- при частичном возврате массив MTECommerceGA4EventItem.
##### remove_from_cart
Пользователь удаляет товар из корзины, карточки товара.
Обязательные поля: массив MTECommerceGA4EventItem.
##### select_item
Пользователь кликает по товарам в каталоге, результате поиска, товарных блоках и других списках.
Обязательные поля: массив MTECommerceGA4EventItem.
##### select_promotion
При клике на рекламные акции.
Обязательные поля: массив MTECommerceGA4EventItem.
##### view_cart
Пользователь посетил страницу корзины.
Обязательные поля: массив MTECommerceGA4EventItem.
##### view_item
Пользователь просматривает карточку товара.
Обязательные поля: массив MTECommerceGA4EventItem.
##### view_item_list
Пользователь просматривает список товаров.
Обязательные поля: массив MTECommerceGA4EventItem.
##### view_promotion
При просмотре рекламных акций на странице.
Обязательные поля: массив MTECommerceGA4EventItem.

#### MTECommerceGA4EventItem
Массив items представляет собой структуру MTECommerceGA4EventItem
```swift
let item = MTEcommerceGA4EventItem(
                                    itemId: String,
                                    itemName: String,
                                    itemListName: String?,
                                    itemListId: String?,
                                    index: String?,
                                    itemBrand: String?,
                                    itemCategory: String?,
                                    itemCategory2: String?,
                                    itemCategory3: String?,
                                    itemCategory4: String?,
                                    itemCategory5: String?,
                                    itemVariant: String?,
                                    affiliation: String?,
                                    discount: String?,
                                    coupon: String?,
                                    price: String?,
                                    currency: String?,
                                    quantity: String?,
                                    locationId: String?,
                                    creativeName: String?,
                                    creativeSlot: String?,
                                    promotionId: String?,
                                    promotionName: String?,
                                    parameters: [String: Any?]?
)
```

### MTECommerceUAEvent
```swift
let event = MTEcommerceUAEvent(eventName: MTEcommerceUAEventName, ecommerce: MTECommerceUA))

let ecommerceUA = MTECommerceUA(
                                purchase: MTECommerceUA.Purchase?,
                                checkoutOption: MTECommerceUA.CheckoutOption?,
                                add: MTECommerceUA.Add?,
                                checkout: MTECommerceUA.Checkout?,
                                refund: MTECommerceUA.Refund?,
                                remove: MTECommerceUA.Remove?,
                                click: MTECommerceUA.Click?,
                                promoClick: MTECommerceUA.PromoClick?,
                                detail: MTECommerceUA.Detail?,
                                impressions: MTECommerceUA.Impressions?,
                                promoView: MTECommerceUA.PromoView?
)
```
Внутри purchase, checkoutOption, add и т.д могут находится структуры **ActionField** и массив **Product**.

При выборе определенного кейса в **MTECommerceUAEventName** в eventName, есть обязательные поля для корректной разметки.
##### checkout_option
Пользователь выбрал способ оплаты или выбрал способ доставки.
Обязательные поля:
- ActionField внутри *CheckoutOption* непустой.

##### add
Пользователь добавляет товар в корзину из карточки товара или любых других товарных блоков.
Обязательные поля:
- Массив Product внутри *Add* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### checkout
Пользователь переходит на страницу оформления заказа.
Обязательные поля:
- Массив Product внутри *Checkout* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### purchase
Пользователь совершил покупку. Данное событие должно срабатывать только один раз для оформленного заказа.
Обязательные поля:
- ActionField внутри *Purchase* непустой. Поля *id*, *revenue* должны быть заполнены.
- Массив Product внутри *Purchase* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### refund
Пользователь возвращает покупку.
Обязательные поля:
- ActionField внутри *Refund* непустой. При полном возврате поле *id* должно быть заполнено, при частичном в *Product* поля *id*, *quantity* также обязательны к заполнению.

##### remove
Пользователь удаляет товар из корзины, карточки товара.
Обязательные поля:
- Массив Product внутри *Remove* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### click
Пользователь кликает по товарам в каталоге, результате поиска, товарных блоках и других списках.
Обязательные поля:
- Массив Product внутри *Click* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### promoClick
При клике на рекламные акции.
Обязательные поля:
- Массив Promotions внутри *PromoClick* непустой. В каждом Promotion поля *name* и *id* должны быть заполнены.

##### detail
Пользователь просматривает карточку товара.
Обязательные поля:
- Массив Product внутри *Product* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### impressions
Пользователь просматривает список товаров.
Обязательные поля:
- Массив Product внутри *Impressions* непустой. В каждом Product поля *name* и *id* должны быть заполнены.

##### promoView
При просмотре рекламных акций на странице.
Обязательные поля:
- Массив Promotions внутри *PromoView* непустой. В каждом Promotion поля *name* и *id* должны быть заполнены.

## <a name="goto_deeplink">Отслеживание deeplink</a>

### UISceneDelegate

Чтобы отслеживать открытия приложения с помощью link, в *UISceneDelegate* в метод ```scene:willConnectToSession:options:``` добавьте код:

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let userActivity = connectionOptions.userActivities.first
    if userActivity?.activityType == NSUserActivityTypeBrowsingWeb {
        // Universal Link
        if let url = userActivity?.webpageURL {
            mtsAnalytics.track(url: url, parameters: [:])
        }
    } else {
        // Deeplink
        if let context = connectionOptions.urlContexts.first {
            mtsAnalytics.track(url: context.url, parameters: [:])
        }
    }
}
```

Чтобы отслеживать открытия приложения в запущенном приложении, используйте код:

```swift
func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    let url = userActivity.webpageURL
    if userActivity.activityType == NSUserActivityTypeBrowsingWeb, let url {
        mtsAnalytics.track(url: url, parameters: [:])
    }
}

func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    if let context = URLContexts.first {
        mtsAnalytics.track(url: context.url, parameters: [:])
    }
}
```

### UIApplicationDelegate

Чтобы отслеживать открытия приложения с помощью deeplink или обработку deeplink в запущенном приложении, используйте UIApplicationDelegate и добавьте следующие изменения:

```swift
func application(_ application: UIApplication, trackOpeningURL url: URL) -> Bool {
    mtsAnalytics.track(url: context.url, parameters: [:])
    return true
}

func application(_ application: UIApplication, openURL url: URL, sourceApplication: String?, annotation: AnyObject) -> Bool {
    mtsAnalytics.track(url: context.url, parameters: [:])
    return true
}

func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    if userActivity.activityType == NSUserActivityTypeBrowsingWeb, let url = userActivity.webpageURL {
        mtsAnalytics.track(url: context.url, parameters: [:])
    }
    return true
}
```
