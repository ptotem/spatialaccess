;(function($) {
	var jqPluginName = 'form_validator';
	var Init = function(element, options)
		{
		var config = $.extend(true, {}, $.fn[jqPluginName].defaults, options);
		var err_dic = ['cлишком коротко', 'cлишком длинно', "необходимо обязательно заполнить", "Неправильный адрес электронной почты", "заполненно некорректно"];
		config.context = element;
		var text_fields = config.context.find("input[type='text'], input[type='password'], textarea");
		config.context.on('submit', handleSubmit);
		
		if (typeof config.general.title_fill == "number")
			{
			title_fill();
			text_fields
				.focus
				(
				function()
					{
					$(this).val() == $(this).attr("title")?$(this).val(""):"";
					}
				).blur
				(
				function() 
					{
					$(this).val() == ""?$(this).val($(this).attr("title")):"";
					}
				);
			}
		function title_fill()
			{
			text_fields.each(function()
				{
				$(this).val() == ""?$(this).val($(this).attr("title")):"";
				});
			}
		
		function get_rule(field)
			{
			if ("object" == typeof config.fields[field.attr('id')])
				return $.extend(true, {}, config.general, config.fields[field.attr('id')]);
			else
				return config.general;
			};
		
		var check = 
			{
			title_fill: function(field)
				{
				return {'flag': 1}
				},
			required: function(field)
				{
				if (!field[jqPluginName].str_length && field[jqPluginName].rule.required)
					return {'flag': 0, "err": 2, "log": "!"};
				return {'flag': 1}
				},
			name: function(field)
				{
				if (!/^[a-zа-яё\s]{2,}$/i.test(field.val()) && this.required(field).flag && field[jqPluginName].str_length)
					return {'flag': 0, "err": 4, "log": ", используйте только руские или английские буквы."}
				return {'flag': 1}
				},
			url: function(field) /*!!! Доделать !!!*/
				{
				var pattern = new RegExp('^(http|https)\://[a-zA-Z0-9\-\.]+\.[a-z]{2,­3}(:[a-z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&am­p;%\$#\=~])*$', 'i')
				if (!pattern.test(field.val()) && this.required(field).flag && field[jqPluginName].str_length)
					return {'flag': 0, "err": 4, "log": ", это не url адрес"}
				return {'flag': 1}
				},
			phone: function(field)
				{
				if (!/^[0-9\s()\-+]{5,}\d$/i.test(field.val()) && this.required(field).flag && field[jqPluginName].str_length)
					return {'flag': 0, "err": 4, "log": ", используйте только цифры скобки пробелы и тире. Не мение 5 символов"}
				return {'flag': 1}
				},
			integer_type: function(field)
				{
				if (!/^[0-9]+$/i.test(field.val()) && this.required(field).flag && field[jqPluginName].str_length)
					return {'flag': 0, "err": 4, "log": ", используйте только цифры."}
				return {'flag': 1}
				},
			float_type: function(field)
				{
				if (!/^[0-9\.\,]+$/i.test(field.val()) && this.required(field).flag && field[jqPluginName].str_length)
					return {'flag': 0, "err": 4, "log": ", используйте только цифры точки."}
				return {'flag': 1}
				},
			email: function(field)
				{
				if (this.required(field).flag && field[jqPluginName].str_length)
					{
					var reEmail = new RegExp('^[a-z0-9\._-]+@[a-z0-9][a-z0-9_-]*(\.[a-z0-9_-]+)*'+
											'\.([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|'+
											'int|mil|museum|name|net|org|pro|travel)$', 'i');
					if (!reEmail.test(field.val()))
						return {'flag': 0, "err": 3, "log": "!"}
					}
				return {'flag': 1}
				},
			field_length: function(field)
				{
				if (this.required(field).flag && field[jqPluginName].str_length)
					{
					if (typeof field[jqPluginName].rule.field_length == "number")
						{
						var min_length = field[jqPluginName].rule.field_length;
						var max_length = config.general.field_length.max;
						}
					else if (typeof field[jqPluginName].rule.field_length == "object")
						{
						var min_length = field[jqPluginName].rule.field_length.min?field[jqPluginName].rule.field_length.min:config.general.field_length.min;
						var max_length = field[jqPluginName].rule.field_length.max?field[jqPluginName].rule.field_length.max:config.general.field_length.max;
						}
					
					if (field[jqPluginName].str_length < min_length)
						return {'flag': 0, "err": 0, "log": ", необходимо ввести не менее " + min_length + " символов"};
					else if (field[jqPluginName].str_length > max_length)
						return {'flag': 0, "err": 1, "log": ", необходимо ввести не более " + max_length + " символов"};
					}
				return {'flag': 1};
				}
			};
		
		function handleSubmit(e) 
			{
			var errors = [];
			var valid_flag = 1;

			$("#short_info input").css("border","");
			
			text_fields.each(function()
				{
				var field =  $(this);
				field[jqPluginName].rule = get_rule(field);
				field[jqPluginName].str_length = field.val().length;
				$.each(field[jqPluginName].rule, function(key, value)
					{
					var check_result = check[key](field);
					if (!check_result.flag)
						{
						var field_name = "без имени";
						
						if (field.attr('title'))
							field_name = field.attr('title');
						else if ($('label[for="'+field.attr('id')+'"]').text().length)
							field_name = $('label[for="'+field.attr('id')+'"]').text().replace(':', '');
						
						errors.push({'text': err_dic[check_result.err], 'field': field_name, 'field_id': field.attr('id'), "log": check_result.log});
						}
					});
				});
			if (errors.length)
				{
				if (typeof config.general.title_fill == "number")
					title_fill();
				for (var i=0; i<errors.length; i++)
				    $("#"+errors[i].field_id).css("border","5px solid #dc3333");
				
			    $("#"+errors[0].field_id).focus();
				    
					//alert('Поле "'+errors[i].field+'" - '+errors[i].text + errors[i].log);
				config.context.attr(jqPluginName, '0');
				e.preventDefault();
				}
			else
				{
				config.context.attr(jqPluginName, '1');
				}

			}
		config.context.data(jqPluginName, this);
	}
	$.fn[jqPluginName] = function(options) {       
		return this.each(function () {
			var _this = $(this);           
			if (!_this.data(jqPluginName))
			{
				new Init(_this, options);
			}
		});
	}
	$.fn[jqPluginName].defaults = 
		{
		context: null,
		general:
			{
			title_fill: "",
			field_length:
				{
				max: 100000,
				min: 0
				},
			required: 0
			},
		fields:
			{
			id_fio: 
				{
				required: 1,
				field_length: 
					{
					min: 3,
					max: 50
					}
				},
			id_email:
				{
				required: 1,
				email: 1
				},
			id_phone:
				{
				required: 1,
				field_length: 7
				}
			}
		}
})(jQuery); 