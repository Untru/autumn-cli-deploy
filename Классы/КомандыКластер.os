#Использовать "../src/MyLib/v8rac"

Перем Кластер Экспорт;
Перем ИдентификаторИнформационнойбаза Экспорт;
Перем ИдентификаторПроцесса Экспорт;
Перем Идентификатор Экспорт;
Перем _КомандыПараметры Экспорт;

&Характер("Компанейский")
&Желудь
Процедура ПриСозданииОбъекта() Экспорт

КонецПроцедуры

Процедура УстановитьИдентификатор(ВходящийИдентификатор) Экспорт
	Идентификатор = ВходящийИдентификатор;
КонецПроцедуры

Процедура Инициализировать(ИдентификаторЛога) Экспорт
	
	Кластер = Новый УправлениеКластером;
	Кластер.ИдентификаторЛога = ИдентификаторЛога;
	
	ИдентификаторИнформационнойбаза = "";
	
	ПутьКСерверу = _КомандыПараметры.ВернутьСвойство("PathServer1с"); 
	Кластер.УстановитьКластер(ПутьКСерверу);
	Кластер.ИспользоватьВерсию("8.3");
	
	Если _КомандыПараметры.ЗапускатьRas Тогда

		ВключитьRAS();

	КонецЕсли;

	Кластер.Подключить();
	
	ИдентификаторИнформационнойбаза = Кластер.НайтиИнформационнуюБазу(_КомандыПараметры.ВернутьСвойство("NameDB"));
	_КомандыПараметры.ИдентификаторИнформационнойбаза = ИдентификаторИнформационнойбаза;
	
	Кластер.УстановитьАвторизациюИнформационнойБазы(ИдентификаторИнформационнойбаза
		, _КомандыПараметры.ВернутьСвойство("UsrLogin1c"), _КомандыПараметры.ВернутьСвойство("UsrPswd1c"));
	
	
КонецПроцедуры

Процедура ВключитьRAS()
	
	ИмяПроцесса = "ras";
	МассивПроцессов = НайтиПроцессыПоИмени(ИмяПроцесса);
	
	Для Каждого Процесс Из МассивПроцессов Цикл
		Процесс.Завершить();
	КонецЦикла;
	
	EXERAS = "C:\\Program Files\\1cv8\\8.3.22.2283\\bin\\ras.exe";
	PathServer1с = _КомандыПараметры.ВернутьСвойство("PathServer1с");
	
	Команда = Новый Команда;
	Команда.УстановитьСтрокуЗапуска(ОбщегоНазначения.ОбернутьВКавычки(EXERAS) + " cluster " + PathServer1с);
	КодВозврата = Команда.Исполнить();
	
КонецПроцедуры

Процедура ЗаблокироватьБазу() Экспорт
	
	Кластер.БлокировкаИнформационнойБазы(_КомандыПараметры.ИдентификаторИнформационнойбаза, "База заблокирована для обновления", "Обновление");	
	Кластер.ОтключитьСеансыИнформационнойБазы(_КомандыПараметры.ВернутьСвойство("NameDB"));
	Кластер.ОтключитьСоединенияИнформационнойБазы(_КомандыПараметры.ВернутьСвойство("NameDB"));
	
КонецПроцедуры

Процедура РазблокироватьБазу() Экспорт
	
	Сообщить(_КомандыПараметры.ИдентификаторИнформационнойбаза);
	Кластер.СнятьБлокировкуИнформационнойБазы(_КомандыПараметры.ИдентификаторИнформационнойбаза, Истина);
	
КонецПроцедуры