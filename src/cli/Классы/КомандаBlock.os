
&Пластилин Перем МенеджерОпций;
&Пластилин Перем КомандыКластер;

&Логгер
Перем Логгер;

&Опция(Имя = "NameDB", Описание = "Имя базы данных")
Перем NameDB;

&Опция(Имя = "UsrLogin1c", Описание = "Имя пользователя кластера 1с")
Перем UsrLogin1c;

&Опция(Имя = "UsrPswd1c", Описание = "Пароль пользователя кластера 1с")
Перем UsrPswd1c;

&Опция(Имя = "PathServer1с", Описание = "Путь к серверу 1c")
Перем PathServer1с;

&Опция(Имя = "PathServerRAS", Описание = "Путь к серверу RAS")
Перем PathServerRAS;

&Опция(Имя = "AccessCode", Описание = "Код доступа")
Перем AccessCode;

&Опция(Имя = "Auth", Описание = "Нужна аутентификация")
Перем Auth;


&КомандаПриложения(Имя = "block", Описание = "Операция блокирует базу с определенным кодом доступа")
Процедура ПриСозданииОбъекта()


КонецПроцедуры

&ВыполнениеКоманды
Процедура ОбработатьКоманду() Экспорт

	Настройка();
	КомандыКластер.Инициализировать();

	Если ЗначениеЗаполнено(Auth) Тогда
		КомандыКластер.УстановитьАвторизациюКластера(UsrLogin1c, UsrPswd1c);
	КонецЕсли;	
	КомандыКластер.ЗаблокироватьБазу();


 	Логгер.Информация("Обработка завершена");
	
КонецПроцедуры

Процедура Настройка()

	НастройкиВыполнения = Новый Структура;
	НастройкиВыполнения.Вставить("UsrLogin1c", UsrLogin1c);
	НастройкиВыполнения.Вставить("UsrPswd1c", UsrPswd1c);
	НастройкиВыполнения.Вставить("PathServer1с", PathServer1с);	
	НастройкиВыполнения.Вставить("PathServerRAS", PathServerRAS);	
	НастройкиВыполнения.Вставить("NameDB", NameDB);
	НастройкиВыполнения.Вставить("AccessCode", AccessCode);

	МенеджерОпций.УстановитьПараметры(НастройкиВыполнения);

КонецПроцедуры
