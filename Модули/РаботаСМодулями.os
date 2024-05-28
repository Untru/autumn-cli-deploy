Функция ОбработкиИзРепозитория(НастройкиВыполнения) Экспорт
	
	ОбработкиРепозитория = Новый Соответствие();
	ПутьКРепозиторию = НастройкиВыполнения["ПутьКРепозиторию"];
	
	Путь = СтрШаблон("%1\%2", ПутьКРепозиторию, "src\epf");
	Маска = "*.xml";
	
	Файлы = НайтиФайлы(Путь, Маска, Ложь);
	
	Для Каждого Файл Из Файлы Цикл
		
		НомерВерсии = "";
		ИмяОбработки = Файл.ИмяБезРасширения;
		ПутьКМодулюОбъекта = СтрШаблон("%1/%2/Ext/ObjectModule.bsl", Файл.Путь, ИмяОбработки);
		
		Текст = Новый ЧтениеТекста();
		Текст.Открыть(ПутьКМодулюОбъекта, КодировкаТекста.UTF8NoBOM);
		
		ТекстМодуля = Текст.Прочитать();
		ТекстМодуля = СокрЛП(ТекстМодуля);
		Текст.Закрыть();
		
		РегуляркаОбластьВерсии = Новый РегулярноеВыражение("Регистрация\.Версия\s*=\s*""\d+(\.\d+)?");
		РегуляркаОбластьВерсии.Многострочный = Истина;
		РегуляркаОбластьВерсии.ИгнорироватьРегистр = Истина;
		
		КоллекцияСовпадений = РегуляркаОбластьВерсии.НайтиСовпадения(ТекстМодуля);
		Если КоллекцияСовпадений.Количество() > 0 Тогда
			РегуляркаВерсия = Новый РегулярноеВыражение("\d+(\.\d+)?");
			РегуляркаВерсия.Многострочный = Истина;
			РегуляркаВерсия.ИгнорироватьРегистр = Истина;
			
			КоллекцияСовпаденийВерсии = РегуляркаВерсия.НайтиСовпадения(КоллекцияСовпадений[0].Значение);
			НомерВерсии = КоллекцияСовпаденийВерсии[0].Значение;
		КонецЕсли;
		ОбработкиРепозитория.Вставить(ИмяОбработки, НомерВерсии);
	КонецЦикла;
	
	Возврат ОбработкиРепозитория;

КонецФункции