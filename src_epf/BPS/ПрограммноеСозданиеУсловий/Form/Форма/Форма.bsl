﻿
&НаКлиенте
Процедура КомандаСоздатьУсловие(Команда)
	
	ФормаСправочника = ПолучитьФорму("Справочник.бпсУсловия.Форма.ФормаЭлемента");
	ДанныеФормы = ФормаСправочника.Объект; // Получаем объект формы в переменную
	ЗаполнитьДокументНаСервере(ДанныеФормы); // Заполняем документ на сервере
	КопироватьДанныеФормы(ДанныеФормы, ФормаСправочника.Объект); // копируем наш объект в объект формы и далее открываем ее
	ФормаСправочника.ОпределитьОтборНаСервере();
	ЭлементыОтбора = ФормаСправочника.КомпоновщикНастроекКомпоновкиДанных.Настройки.Отбор.Элементы;
	
	ПолеКомпоновкиДанных = Новый ПолеКомпоновкиДанных("СуммаДоговора");	
	ЭлементОтбора = ЭлементыОтбора.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));	
	ЭлементОтбора.Использование = Истина;
	ЭлементОтбора.ЛевоеЗначение = ПолеКомпоновкиДанных;
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.БольшеИлиРавно;
	ЭлементОтбора.ПравоеЗначение = 100000;
	
	ФормаСправочника.Объект.Наименование = "" + ФормаСправочника.КомпоновщикНастроекКомпоновкиДанных.Настройки.Отбор;
	ФормаСправочника.Открыть();	
	ФормаСправочника.Записать();
	ФормаСправочника.Закрыть();
	
КонецПроцедуры


&НаСервере
Функция ЗаполнитьДокументНаСервере(ДанныеФормы);

	СпрОбъект = ДанныеФормыВЗначение(ДанныеФормы, Тип("СправочникОбъект.бпсУсловия")); // Получаем объект из данных формы ИЛИ
	СпрОбъект = Справочники.бпсУсловия.СоздатьЭлемент();
	// Заполняем реквизиты объекта или другие действия ********

	СпрОбъект.Владелец = Объект.ТипОбъекта;
	
	ЗначениеВДанныеФормы(СпрОбъект,ДанныеФормы); // Кладем обратно в объект формы уже созданный документ
КонецФункции
