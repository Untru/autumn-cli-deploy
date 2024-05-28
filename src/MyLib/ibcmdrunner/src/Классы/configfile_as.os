Перем ПараметрыСервера;			// Соответствие - параметры секции server
Перем ПараметрыСервернойБазыДанных;	// Соответствие - параметры секции database
Перем ПараметрыФайловойБазыДанных;	// Соответствие - параметры секции database
Перем ПараметрыИБ;				// Соответствие - параметры секции infobase
Перем ПараметрыХТТП;			// Соответствие - параметры секции http
Перем ПараметрыВеб_Аутентификация;	// Соответствие - параметры секции auth
Перем ПараметрыВеб_Разделители;		// Соответствие - параметры секции zones
Перем ПараметрыВеб_Приложение;		// Соответствие - параметры секции application
Перем ПараметрыВеб_ПубликацияOData;	// Соответствие - параметры секции odata
Перем ПараметрыВеб_РежимПовторногоИспользованияСеансов;	// Соответствие - параметры секции reuse-sessions
Перем ПараметрыВебСервисовОбщие;	// Соответствие - параметры секции web-services
Перем ПараметрыВебСервисов;		// Соответствие - параметры секции service
Перем ПараметрыХТТПСервисовОбщие;	// Соответствие - параметры секции http-services
Перем ПараметрыХТТПСервисов;	// Соответствие - параметры секции service
Перем ПараметрыПубликацииДистрибутивов;	// Соответствие - параметры секции pubdst

Перем мсвПараметрыВеб_Разделители; 	// массив параметров Веб разделителей
Перем мсвПараметрыВебСервисов;		// массив параметров веб сервисов
Перем мсвПараметрыХТТПСервисов;		// массив параметров хттп-сервисов

#Область ПрограммныйИнтерфейс

// ПараметрыСервера
// 		Установка параметров автономного сервера
// Параметры:
// 	 Адрес - Строка - IP-адрес автономного сервера
//	 Порт - Число - Имя порта автономного сервера
//	 ИмяХоста - Строка - имя хоста (необязательный)
Процедура ПараметрыСервера(Адрес,
	Порт = 8314,
	ИмяХоста = Неопределено) Экспорт
	ПараметрыСервера. Очистить();
	ПараметрыСервера.Вставить("address", Адрес);
	ПараметрыСервера.Вставить("port", Порт);
	Если ИмяХоста <> Неопределено Тогда
		ПараметрыСервера.Вставить("host", ИмяХоста);
	КонецЕсли;	
КонецПроцедуры

// ПараметрыСервернойБД
// 		Установка параметров серверной автономной базы
// Параметры:
//	 ТипСУБД - Строка - тип СУБД
//	 Сервер - Строка - имя сервера или IP-адрес
//	 ИмяДБ - Строка - имя базы данных
//	 ИмяПользователя - Строка - имя пользователя серверной базы данных
//	 Пароль - Строка - пароль пользователя серверной базы данных
Процедура ПараметрыСервернойБД(ТипСУБД,
	Сервер,
	ИмяДБ,
	ИмяПользователя,
	Пароль) Экспорт

	ПараметрыСервернойБазыДанных.Очистить();
	ПараметрыФайловойБазыДанных.Очистить();
	ПараметрыСервернойБазыДанных.Вставить("dbms", ТипСУБД);
	ПараметрыСервернойБазыДанных.Вставить("server", Сервер);
	ПараметрыСервернойБазыДанных.Вставить("name", ИмяДБ);
	ПараметрыСервернойБазыДанных.Вставить("user", ИмяПользователя);
	ПараметрыСервернойБазыДанных.Вставить("password", Пароль);
	
КонецПроцедуры

// ПараметрыФайловойБД
// 		Установка параметров файловой БД
// Параметры:
//	 ПутьКФайлуИБ - Строка - Путь к файлу информационной базы.
//	 ИмяПользователя - Строка - имя пользователя информационной базы
//	 Пароль - Строка - пароль пользователя информационной базы
Процедура ПараметрыФайловойБД(ПутьКФайлуИБ,
	ИмяПользователя,
	Пароль) Экспорт

	ПараметрыСервернойБазыДанных.Очистить();
	ПараметрыФайловойБазыДанных.Очистить();
	ПараметрыФайловойБазыДанных.Вставить("path", ПутьКФайлуИБ);
	ПараметрыФайловойБазыДанных.Вставить("user", ИмяПользователя);
	ПараметрыФайловойБазыДанных.Вставить("password", Пароль);
	
КонецПроцедуры

// ПараметрыИБ
// 		Установка параметров информационной базы
// Параметры:
//	 ИмяИБ - Строка - имя информационной базы
//	 ВыдаватьКлиентскиеЛицензии - Булево - разрешить выдавать клиентские лицензии автономному серверу
//	 РазрешитьРегламентныеЗадания - Булево - разрешить выполнение регламентных заданий
//	 ИД - Строка - уникальный идентификатор информационной базы. По умолчанию - значение unique, то есть
//		каждый раз при перезапуске будет генерироваться новый уникальный идентификатор. 
Процедура ПараметрыИБ(ИмяИБ,
	ВыдаватьКлиентскиеЛицензии,
	РазрешитьРегламентныеЗадания,
	ИД = "unique") Экспорт

	ПараметрыИБ.Очистить();
	ПараметрыИБ.Вставить("id", ИД);
	ПараметрыИБ.Вставить("name", ИмяИБ);
	ПараметрыИБ.Вставить("distribute-licenses", ВыдаватьКлиентскиеЛицензии);
	ПараметрыИБ.Вставить("shedule-jobs", РазрешитьРегламентныеЗадания);

КонецПроцедуры

// ПараметрыХТТП
// 		Установка параметров веб-доступа к информационной базе.
// Параметры:
//	 БазовыйУРЛ - Строка - Базовый путь доступа к информационной базе с помощью веб-сервера.
//		 К одной информационной базе можно организовать несколько публикаций,
//		 которые отличаются базовыми путями и другими параметрами публикации.
// 		Значение по умолчанию:/.
Процедура ПараметрыХТТП(БазовыйУРЛ = "/") Экспорт

	ПараметрыХТТП.Очистить();
	ПараметрыХТТП.Вставить("base", БазовыйУРЛ);
КонецПроцедуры	

// ПараметрыВеб_Аутентификация
// 		Установка параметров веб-аутентификации OpenId (секции rely и provider)
// Параметры:
//	 УРИПровайдера - Строка - указывает URL информационной базы «1С:Предприятия», выступающей в роли OpenID-провайдера.
//	 ВремяЖизни - Число - время жизни признака аутентифицированности идентификатора в секундах.
//		 Значение по умолчанию - 86400 секунд.
//	 МаскаРазрешенныхИмен - Строка - представляет собой регулярное выражение, которое определяет
//		 маску разрешенных имен сайтов, на которые могут выполняться переадресации пользовательского
//		 веб-браузера (параметр запроса openid.return_to) после исполнения команды OpenID-провайдера.
//	 ПровайдерыOpenIDConnect - Строка - данный элемент содержит описание внешних OpenID-провайдеров,
//		 поддерживающих протокол авторизации OpenID Connect v1.0 (http://openid.net/connect/).
//		 Описание представляет собой массив объектов, каждый из которых описывает одного
//		 OpenID-провайдера. Массив представлен в виде JSON-сериализации.
//		 Подробнее см. https://its.1c.ru/db/v8314doc#bookmark:adm:TI000000847
//  РазрешитьАутентификацию1С - Булево -указывает возможность применения аутентификации «1С:Предприятия».  
Процедура ПараметрыВеб_Аутентификация(УРИПровайдера,
	ВремяЖизни = 86400,
	МаскаРазрешенныхИмен = Неопределено,
	ПровайдерыOpenIDConnect = Неопределено,
	РазрешитьАутентификацию1С = Истина) Экспорт

	ПараметрыВеб_Аутентификация.Очистить();
	ПараметрыВеб_Аутентификация.Вставить("url", УРИПровайдера);
	ПараметрыВеб_Аутентификация.Вставить("lifetime", ВремяЖизни);
	ПараметрыВеб_Аутентификация.Вставить("return-to", МаскаРазрешенныхИмен);
	ПараметрыВеб_Аутентификация.Вставить("providers", ПровайдерыOpenIDConnect);
	ПараметрыВеб_Аутентификация.Вставить("allow-standart", РазрешитьАутентификацию1С);

КонецПроцедуры

// ДобавитьПараметрыВеб_Разделители
// 		Добавление параметров разделителя в массив параметров разделителей ИБ.
// 		Массив параметров разделителей содержит описание разделителей для базового
// 		каталога доступа. Если прикладное решение содержит несколько разделителей,
// 		данная секция может содержать несколько записей. Каждая запись описывает параметры
// 		одного разделителя в порядке их (разделителей) следования в метаданных.
// Параметры:
//	 Разделитель - Строка - явное указание значения разделителя, который находится на этой позиции.
//	 РазрешитьИзменение - Булево - Параметр управляет возможностью изменения значения
//		 разделителя из кода прикладного решения.
//	 ДобавлятьЗначениеВАдрес - Булево - определяет необходимость присутствия значения
//		 данного разделителя в адресе публикуемой информационной базы
//	 ЭтоПервоеЗначениеРазделителя - Булево - флаг для инициализации массива параметров.
Процедура ДобавитьПараметрыВеб_Разделители(Разделитель,
	РазрешитьИзменение = Ложь,
	ДобавлятьЗначениеВАдрес = Ложь,
	ЭтоПервоеЗначениеРазделителя = Истина) Экспорт

	ПараметрыВеб_Разделители.Очистить();
	ПараметрыВеб_Разделители.Вставить("value", Разделитель);
	ПараметрыВеб_Разделители.Вставить("safe", РазрешитьИзменение);
	ПараметрыВеб_Разделители.Вставить("specify", ДобавлятьЗначениеВАдрес);
	
	Если ЭтоПервоеЗначениеРазделителя Тогда
		мсвПараметрыВеб_Разделители = Новый Массив;
	КонецЕсли;	
	мсвПараметрыВеб_Разделители.Добавить(ПараметрыВеб_Разделители);

КонецПроцедуры

// ПараметрыВеб_Приложение
// 		Установка параметров публикации управляемого приложения (application)
// Параметры:
//	 УРИВозврата - Строка - адрес (URL), по которому будет выполнен переход после завершения работы веб-клиента.
//	 Публиковать - Булево - Определяет возможность использовать клиентское приложение для доступа 
//		к информационной базе.
Процедура ПараметрыВеб_Приложение(УРИВозврата, Публиковать = Истина) Экспорт
	ПараметрыВеб_Приложение = Новый Соответствие;
	ПараметрыВеб_Приложение.Вставить("publish", Публиковать);
	ПараметрыВеб_Приложение.Вставить("exit-url", УРИВозврата);
КонецПроцедуры 

// ПараметрыВеб_ПубликацияOData
//		Установка параметров публикации интерфейса OData
// Параметры:
//	 Публиковать - Булево - Управляет доступностью стандартного интерфейса OData через указанную публикацию.
//	 ПараметрыРежимаПовторногоИспользованияСеансов - Соответствие - параметры режима повторного
//		использования сеансов (см. описание следующего метода).
Процедура ПараметрыВеб_ПубликацияOData(Публиковать = Ложь,
	ПараметрыРежимаПовторногоИспользованияСеансов = Неопределено) Экспорт

	ПараметрыВеб_ПубликацияOData.Очистить();
	ПараметрыВеб_ПубликацияOData.Вставить("publish", Публиковать);
	Если ПараметрыРежимаПовторногоИспользованияСеансов <> Неопределено Тогда
		ПараметрыВеб_ПубликацияOData.Вставмит("reuse-sessions", ПараметрыРежимаПовторногоИспользованияСеансов);
	КонецЕсли;

КонецПроцедуры	

// ПараметрыВеб_РежимПовторногоИспользованияСеансов
// 		Устанавливает параметры повторного использования сеансов
// Параметры:
//	 Режим - Строка - AutoUse, DontUse, Use
//	 ВремяБездействия - Число -Время бездействия сеанса, после которого он завершается принудительно (в секундах).
//	 МаксимальноеКоличествоСеансов - Число - Максимальное количество сеансов, которые могут быть созданы при
//		автоматическом управлении сеансами. 
//	 ТаймаутОжиданияСвободногоСеанса - Число - Время ожидания появления свободного сеанса после заполнения
//		пула сеансов (в секундах).
Процедура ПараметрыВеб_РежимПовторногоИспользованияСеансов(Режим = "AutoUse", 
	ВремяБездействия = 20, 
	МаксимальноеКоличествоСеансов = 10,
	ТаймаутОжиданияСвободногоСеанса = 5) Экспорт

	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Очистить();
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("mode", Режим);
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("max-age", ВремяБездействия);
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("pool-size", МаксимальноеКоличествоСеансов);
	ПараметрыВеб_РежимПовторногоИспользованияСеансов.Вставить("pool-timeout", ТаймаутОжиданияСвободногоСеанса);

КонецПроцедуры

// ПараметрыВебСервисовОбщие
// 		Устанавливает параметры доступа к Web-сервисам, которые реализованы в прикладном решении.
// Параметры:
//	 ПубликоватьВебСервисы - Булево - определяет доступность Web-сервисов приложения
//	 ПубликоватьВебСервисыРасширений - Булево - определяет доступность Web-сервисов расширений приложения
Процедура ПараметрыВебСервисовОбщие(ПубликоватьВебСервисы = Истина,
	ПубликоватьВебСервисыРасширений = Ложь) Экспорт

	ПараметрыВебСервисовОбщие.Очистить();
	ПараметрыВебСервисовОбщие.Вставить("publish-by-default", ПубликоватьВебСервисы);
	ПараметрыВебСервисовОбщие.Вставить("publish-extensions-by-default", ПубликоватьВебСервисыРасширений);

КонецПроцедуры

// ДобавитьПараметрыВебСервиса
// 		Добавление в массив параметров отдельного web-сервиса
// Параметры:
//	 Публиковать - Булево - необходимость публикации сервиса
//	 Имя - Строка - имя сервисв
//	 Синоним - Строка - точка подключения сервиса
//	 ПараметрыПовторногоИспользования - Строка - параметры режима
//		повторного использования сеансов. Если параметр пропущен, то
//		это эквивалентно следующим значениям, установленным по умолчанию:
//		mode: AutoUse
//		max-age: 20s
//		pool-size: 10
//		pool-timeout: 5s
//		Подробности: https://its.1c.ru/db/v8314doc#bookmark:adm:TI000000940
//	 ЭтоПервыйСервис - Булево - флаг для инициализации массива web-сервисов 
Процедура ДобавитьПараметрыВебСервиса(Публиковать,
	Имя,
	Синоним,
	ПараметрыПовторногоИспользования,
	ЭтоПервыйСервис) Экспорт

	ПараметрыВебСервисов = Новый Соответствие;
	ПараметрыВебСервисов.Вставить("publish", Публиковать);
	ПараметрыВебСервисов.Вставить("name", Имя);
	ПараметрыВебСервисов.Вставить("alias", Синоним);
	ПараметрыВебСервисов.Вставить("reuse-sessions", ПараметрыПовторногоИспользования);

	Если ЭтоПервыйСервис Тогда
		мсвПараметрыВебСервисов = Новый Массив;
	КонецЕсли;
	мсвПараметрыВебСервисов.Добавить(ПараметрыВебСервисов);

КонецПроцедуры

// ПараметрыХТТПСервисовОбщие
// 		Устанавливает параметры доступа к http-сервисам, которые реализованы в прикладном решении.
// Параметры:
//	 ПубликоватьХТТПСервисы - Булево - определяет доступность http-сервисов приложения
//	 ПубликоватьХТТПСервисыРасширений - Булево - определяет доступность http-сервисов расширений приложения
Процедура ПараметрыХТТПСервисовОбщие(ПубликоватьХТТПСервисы = Истина,
	ПубликоватьХТТПСервисыРасширений = Ложь) Экспорт

	ПараметрыХТТПСервисовОбщие.Очистить();
	ПараметрыХТТПСервисовОбщие.Вставить("publish-by-default", ПубликоватьХТТПСервисы);
	ПараметрыХТТПСервисовОбщие.Вставить("publish-extensions-by-default", ПубликоватьХТТПСервисыРасширений);

КонецПроцедуры

// ДобавитьПараметрыХТТПСервиса
//  	Добавление в массив параметров отдельного http-сервиса
// Параметры:
//	 Публиковать - Булево - необходимость публикации сервиса
//	 Имя - Строка - имя сервисв
//	 КорневойУРЛ - Строка - точка подключения сервиса
//	 ПараметрыПовторногоИспользования - Строка - параметры режима
//		повторного использования сеансов. Если параметр пропущен, то
//		это эквивалентно следующим значениям, установленным по умолчанию:
//		mode: AutoUse
//		max-age: 20s
//		pool-size: 10
//		pool-timeout: 5s
//		Подробности: https://its.1c.ru/db/v8314doc#bookmark:adm:TI000000940
//	 ЭтоПервыйСервис - Булево - флаг для инициализации массива http-сервисов 
Процедура ДобавитьПараметрыХТТПСервиса(Публиковать,
	Имя,
	КорневойУРЛ,
	ПараметрыПовторногоИспользования = Неопределено,
	ЭтоПервыйСервис = Ложь) Экспорт

	ПараметрыХТТПСервисов = Новый Соответствие;
	ПараметрыХТТПСервисов.Вставить("publish", Публиковать);
	ПараметрыХТТПСервисов.Вставить("name", Имя);
	ПараметрыХТТПСервисов.Вставить("root", КорневойУРЛ);
	ПараметрыХТТПСервисов.Вставить("reuse-sessions", ПараметрыПовторногоИспользования);

	Если ЭтоПервыйСервис Тогда
		мсвПараметрыХТТПСервисов = Новый Массив;
	КонецЕсли;
	мсвПараметрыВебСервисов.Добавить(ПараметрыХТТПСервисов);

КонецПроцедуры

// ПараметрыПубликацииДистрибутивов
// 		Устанавливает параметры публикации клиентских дистрибутивов (pubdst)
// Параметры:
//	 ПутьКФайлуВин32 - Строка - Полное имя файла с архивом дистрибутива
//		 32-разрядного клиентского приложения для ОС Windows. 
//	 ПутьКФайлуВин64 - Строка - Полное имя файла с архивом дистрибутива
//		 64-разрядного клиентского приложения для ОС Windows.
//	 ПутьКФайлуМак64 - Строка - Полное имя файла с архивом дистрибутива
//		 64-разрядного клиентского приложения для ОС macOS.
Процедура ПараметрыПубликацииДистрибутивов(ПутьКФайлуВин32, ПутьКФайлуВин64, ПутьКФайлуМак64) Экспорт

	ПараметрыПубликацииДистрибутивов.Очистить();
	ПараметрыПубликацииДистрибутивов.Вставить("win32", ПутьКФайлуВин32);
	ПараметрыПубликацииДистрибутивов.Вставить("win64", ПутьКФайлуВин64);
	ПараметрыПубликацииДистрибутивов.Вставить("mac64", ПутьКФайлуМак64);

КонецПроцедуры

// СоздатьКонфигурационныйФайл
// 		Создание конфигурационного файла по ранее заполненным параметрам
// Параметры:
//	 ПутьКФайлу - Строка - полный путь к конфигурационному файлу
Процедура СоздатьКонфигурационныйФайл(ПутьКФайлу) Экспорт

	Конфиг = Новый ЗаписьТекста(ПутьКФайлу, "UTF-8");
	
	Конфиг.ЗаписатьСтроку("server:");
	ЗаполнитьСекцию(Конфиг, ПараметрыСервера);

	Конфиг.ЗаписатьСтроку("database:");
	Если ПараметрыСервернойБазыДанных.Количество() > 0 Тогда
		Для Каждого Параметр Из ПараметрыСервернойБазыДанных Цикл
			Строка = СтрШаблон("  %1: %2", Параметр.Ключ, Параметр.Значение);
			Конфиг.ЗаписатьСтроку(Строка);
		КонецЦикла;	
	ИначеЕсли ПараметрыФайловойБазыДанных.Количество() > 0 Тогда
		Для Каждого Параметр Из ПараметрыФайловойБазыДанных Цикл
			Строка = СтрШаблон("  %1: %2", Параметр.Ключ, Параметр.Значение);
			Конфиг.ЗаписатьСтроку(Строка);
		КонецЦикла;	
	Иначе
		ВызватьИсключение "Не заданы обязательные параметры базы данных";		
	КонецЕсли;	

	Конфиг.ЗаписатьСтроку("infobase:");
	ЗаполнитьСекцию(Конфиг, ПараметрыИБ);

	Конфиг.ЗаписатьСтроку("http:");
	ЗаполнитьСекцию(Конфиг, ПараметрыХТТП);
	Если ПараметрыВеб_Аутентификация.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  auth:");
		Конфиг.ЗаписатьСтроку("    rely:");
		Значение = ПараметрыВеб_Аутентификация.Получить("url");
		Конфиг.ЗаписатьСтроку("      url: " + Значение);
		Значение = ПараметрыВеб_Аутентификация.Получить("lifetime");
		Конфиг.ЗаписатьСтроку("      lifetime: " + Значение);
		Конфиг.ЗаписатьСтроку("    provider:");
		Значение = ПараметрыВеб_Аутентификация.Получить("return-to");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("      return-to: " + Значение);
		КонецЕсли;	
		Значение = ПараметрыВеб_Аутентификация.Получить("providers");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("      providers: " + Значение);
		КонецЕсли;
		Значение = ПараметрыВеб_Аутентификация.Получить("allow-standard");
		Если Значение = Ложь Тогда
			Конфиг.ЗаписатьСтроку("      allow-standard: false");
		КонецЕсли;	
	КонецЕсли;	

	Если мсвПараметрыВеб_Разделители.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  zones:");
		Для Каждого Разделитель Из мсвПараметрыВеб_Разделители Цикл
			Конфиг.ЗаписатьСтроку("   -");
			ЗаполнитьСекцию(Конфиг, Разделитель, 3);
		КонецЦикла;	
	КонецЕсли;	

	Если ПараметрыВеб_ПубликацияOData.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  odata:");
		Значение = ПараметрыВеб_ПубликацияOData.Получить("publish");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("    publish: " + БулевоВСтроку(Значение));
		КонецЕсли;
		Значение = ПараметрыВеб_ПубликацияOData.Получить("reuse-session");
		Если Значение <> Неопределено Тогда
			Конфиг.ЗаписатьСтроку("    reuse-session:");
			ЗаполнитьСекцию(Конфиг, Значение, 3);
		КонецЕсли;		
	КонецЕсли;

	Если ПараметрыВебСервисовОбщие.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  web-services:");
		ЗаполнитьСекцию(Конфиг, ПараметрыВебСервисовОбщие, 2);
		Если мсвПараметрыВебСервисов.Количество() > 0 Тогда
			Конфиг.ЗаписатьСтроку("    service:");
			Для Каждого ПараметрыВебСервиса Из мсвПараметрыВебСервисов Цикл
				Конфиг.ЗаписатьСтроку("    -");
				ЗаполнитьСекцию(Конфиг, ПараметрыВебСервиса, 3);
			КонецЦикла;	
		КонецЕсли;	
	КонецЕсли;	

	Если ПараметрыХТТПСервисовОбщие.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  http-services:");
		ЗаполнитьСекцию(Конфиг, ПараметрыХТТПСервисовОбщие, 2);
		Если мсвПараметрыХТТПСервисов.Количество() > 0 Тогда
			Конфиг.ЗаписатьСтроку("    service:");
			Для Каждого ПараметрыХТТПСервиса Из мсвПараметрыХТТПСервисов Цикл
				Конфиг.ЗаписатьСтроку("    -");
				ЗаполнитьСекцию(Конфиг, ПараметрыХТТПСервиса, 3);
			КонецЦикла;	
		КонецЕсли;	
	КонецЕсли;	

	Если ПараметрыПубликацииДистрибутивов.Количество() > 0 Тогда
		Конфиг.ЗаписатьСтроку("  pubdst:");
		ЗаполнитьСекцию(Конфиг, ПараметрыПубликацииДистрибутивов, 2);
	КонецЕсли;	

КонецПроцедуры
#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ЗаполнитьСекцию(КонфигФайл, Параметры, Уровень = 1)
	Если Параметры.Количество() > 0 Тогда
		Для Каждого Параметр Из ПараметрыСервера Цикл
			Если ТипЗнч(Параметр.Значение) = Тип("Число") ИЛИ
				ТипЗнч(Параметр.Значение) = Тип("Строка") Тогда
				Значение = Параметр.Значение;
			ИначеЕсли ТипЗнч(Параметр.Значение) = Тип("Булево") Тогда
				Значение = БулевоВСтроку(Параметр.Значение); 
			Иначе
				ВызватьИсключение "Значение параметра имеет неизвестный тип";
			КонецЕсли;	
			Если Уровень = 1 Тогда		
				Строка = СтрШаблон("  %1: %2", Параметр.Ключ, Значение);
			ИначеЕсли Уровень = 2 Тогда
				Строка = СтрШаблон("   %1: %2", Параметр.Ключ, Значение);
			ИначеЕсли Уровень = 3 Тогда
				Строка = СтрШаблон("     %1: %2", Параметр.Ключ, Значение);	
			Иначе
				ВызватьИсключение "Неверно задано значение параметра Уровень";
			КонецЕсли;			
			КонфигФайл.ЗаписатьСтроку(Строка);
		КонецЦикла;	
	КонецЕсли;	
КонецПроцедуры	

Функция БулевоВСтроку(Значение)
	Если Значение = Истина Тогда
		Рез = "true";
	ИначеЕсли Значение = Ложь Тогда
		Рез = "false";
	Иначе
		ВызватьИсключение "Значение должно иметь тип Булево.";
	КонецЕсли;
	Возврат Рез;			
КонецФункции	

Процедура ПриСозданииОбъекта()
	ПараметрыСервера = Новый Соответствие;
	ПараметрыСервернойБазыДанных = Новый Соответствие;
	ПараметрыФайловойБазыДанных = Новый Соответствие;
	ПараметрыИБ = Новый Соответствие;
	ПараметрыВеб_Аутентификация = Новый Соответствие;
	ПараметрыВеб_Разделители = Новый Соответствие;
	ПараметрыВеб_ПубликацияOData = Новый Соответствие;
	ПараметрыВеб_РежимПовторногоИспользованияСеансов = Новый Соответствие;
	ПараметрыВебСервисовОбщие = Новый Соответствие;
	ПараметрыВебСервисов = Новый Соответствие;
	ПараметрыХТТП = Новый Соответствие;
	ПараметрыХТТПСервисовОбщие = Новый Соответствие;
	ПараметрыХТТПСервисов = Новый Соответствие;
	ПараметрыПубликацииДистрибутивов = Новый Соответствие;
КонецПроцедуры
#КонецОбласти
