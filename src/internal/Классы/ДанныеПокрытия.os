
Перем _ПутьКФайлу;

Перем _ТаблицаПокрытия;

#Область ОбработчикиСобытий

Процедура ПриСозданииОбъекта( Знач пИмяФайла, Знач пПокрытие )
	
	_ПутьКФайлу = пИмяФайла;

	данныеПокрытия = пПокрытие[пИмяФайла];

	Если данныеПокрытия = Неопределено Тогда

		покрытыеСтроки = Новый Соответствие;

	Иначе

		покрытыеСтроки = данныеПокрытия.Строки;

	КонецЕсли;

	_ТаблицаПокрытия = Новый ТаблицаЗначений;

	_ТаблицаПокрытия.Колонки.Добавить("Номер");
	_ТаблицаПокрытия.Колонки.Добавить("Покрыто");

	Для Каждого цСтрока Из ФайлыСИсходнымКодом.ПолучитьСтрокиМодуля(пИмяФайла) Цикл
		
		новСтрока = _ТаблицаПокрытия.Добавить();
		новСтрока.Номер = цСтрока.Номер;
		новСтрока.Покрыто = Не покрытыеСтроки[цСтрока.Номер] = Неопределено;

		покрытыеСтроки.Удалить(цСтрока.Номер);
		
	КонецЦикла;

	// Все строки, что есть в покрытии автоматически считаем кодом
	Для каждого цКлючИЗначение Из покрытыеСтроки Цикл

		новСтрока = _ТаблицаПокрытия.Добавить();
		новСтрока.Номер = цКлючИЗначение.Ключ;
		новСтрока.Покрыто = Истина;

	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область ПрограммныйИнтерфейс

Функция ПутьКФайлу() Экспорт
	
	Возврат _ПутьКФайлу;
	
КонецФункции

Функция ТаблицаПокрытия() Экспорт
	
	Возврат _ТаблицаПокрытия;
	
КонецФункции

#КонецОбласти