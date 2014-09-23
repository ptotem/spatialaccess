function getCookie(name) {
	var cookieValue = null;
	if (document.cookie && document.cookie != '') {
		var cookies = document.cookie.split(';');
		for (var i = 0; i < cookies.length; i++) {
			var cookie = jQuery.trim(cookies[i]);
			// Does this cookie string begin with the name we want?
			if (cookie.substring(0, name.length + 1) == (name + '=')) {
				cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
				break;
			}
		}
	}
	return cookieValue;
}

function file_remover(file) {
	$('#tz_file_' + $(file).attr('id') + ', #file_' + $(file).attr('id')).remove();
}

var rootLocation = '/', uploadifySWFLocation = rootLocation + 'static/js/numart/uploadify.swf', imagesLocation = rootLocation + 'static/img/numart/';


var loadedStyleFiles = 0;

function trackLoadedFilesList(e){
	loadedStyleFiles --;
	
	if(loadedStyleFiles<1){
		$('#file_upload_1-button').removeClass('used');
		$('#file_upload_1').uploadify("settings", 'buttonText', 'Прикрепить файлы');
	}
	console.log(e,this);
}

function form_asist() {
	$("#file_upload_1").uploadify({
		queueSizeLimit : 15,
		fileSizeLimit : '20MB',
		height : 25,
		swf : uploadifySWFLocation,
		'cancelImg' : '/static/img/numart/cross_but.png',
		buttonText : 'Прикрепить файлы',
		uploader : '/ajax/',
		formData : {
			'csrfmiddlewaretoken' : $('input[name="csrfmiddlewaretoken"]').val(),
			sessionid : $('#ses_id').val()
		},
		width : 155,
		removeCompleted : false,
		onInit: function(){
			
			$('#file_upload_1-queue').insertBefore($('#file_upload_1'));
		},
		onClearQueue: function(){
			alert('a');
		},
		onUploadSuccess : function(data, response) {
			$('#file_upload_1').append('<input id="file_' + data.id + '" type="hidden" value="' + response + '" name="fs_list"/>')
			
			$('#'+data.id+' .data').remove();
			$('#'+data.id+' .fileName').html(data.name);
			$('#'+data.id+' .cancel a').html('<img src=\'/static/img/numart/cross_but.png\' />')
			.on('click', trackLoadedFilesList);
			$('#'+data.id+' .cancel').insertAfter($('#'+data.id+' .fileName'));
			$('#file_upload_1-button').addClass('used');
			$('#file_upload_1').uploadify("settings", 'buttonText', 'Прикрепить еще');
			
			loadedStyleFiles++;
			
			//$('#file_upload_1-button').addClass('used');//$.insertAfter($('#'+data.id));
			//$('#file_upload_1').uploadify("settings", 'buttonText', 'Прикрепить еще')
		}
	});
	$("#file_upload_2").uploadify({
		queueSizeLimit : 15,
		fileSizeLimit : '20MB',
		multi : false,
		removeCompleted : false,
		height : 25,
		swf : uploadifySWFLocation,
		buttonText : 'Прикрепить ТЗ',
		uploader : '/ajax/',
		formData : {
			'csrfmiddlewaretoken' : $('input[name="csrfmiddlewaretoken"]').val(),
			sessionid : $('#ses_id').val(),
			is_tz : 1
		},
		width : 125,
		onUploadProgress : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
			$('#file_upload_2').uploadify("settings", 'buttonText', 'Загрузка - ' + (bytesUploaded / bytesTotal * 100).toFixed(0) + " %");
		},
		onSelect : function(file) {
			$('#file_upload_2 input').remove();
		},
		onUploadSuccess : function(data, response) {
			$('#file_upload_2').append('<input id="tz_file_' + data.id + '" type="hidden" value="' + response + '" name="tz_name"/>').uploadify("settings", 'buttonText', data.name)
			$('#file_upload_2').width($('#file_upload_2 .uploadify-button-text').width());
			
		},
		onCancel : function(file) {
            alert('The file ' + file.name + ' was cancelled.');
        }
	});
	$('form[name="request"]').form_validator();
	$('#id_site').on('change', function() {
		$('#id_old_site_url').val($(this).val());
	});
	$.datepicker.setDefaults($.datepicker.regional["ru"]);

	$("#id_end_date").datepicker({
		minDate : "+2W",
		showOn : "button",
		buttonImage : imagesLocation + 'cal.png',
		buttonImageOnly : true,
		showOtherMonths : true,
		selectOtherMonths : true
	});

	$("#id_end_date").on('focus', function() {
		$(this).datepicker("show");
	});

	len = {};

	$('.ymenu').toggle(function() {
		$(this).next().slideDown();
	}, function() {
		$(this).next().slideUp();
	});
	$('.rmenu').on('click', function(e) {
		e.preventDefault();
		$(this).css('display', 'none').parent().find('.y_block').css('display', 'block');
		if ($(this).parent().find('.text').length) {
			len = {
				max : $('.scroll .max').position().left,
				min : $('.scroll .min').position().left,
				absolute : $('.y_block .scroll').map(function() {
					return $(this).offset().left;
				})
			}
			len['width'] = len.max - len.min;
		}
	});
	$('.cross').on('click', function(e) {
		e.preventDefault();
		$(this).parents('.y_block').css('display', 'none').prev().css('display', 'inline-block');
	});
	$("#add_info strong").on('click', function() {
		$('#id_budget').val('500 000');
	});
	$("input[type='text'], textarea").focus(function() {
		if ($(this).attr("value") == $(this).attr("title"))
			$(this).attr("value", "");
	}).blur(function() {
		$(this).val($(this).val() == "" ? $(this).attr("title") : $(this).val());
	}).each(function() {
		$(this).val($(this).val() == "" ? $(this).attr("title") : $(this).val());
	});
	$('form[name="request"]').on('submit', function() {
		$(this).find('input[type="file"]').each(function() {
			if ($(this).is(':hidden'))
				$(this).remove();
		});

		$("#fck_spam").val("all spammers go to hell");
		
		if ($(this).attr('form_validator') == "1")
			$(this).find("input[type='text'], textarea").each(function() {
				if ($(this).is(':hidden'))
					$(this).val('');
				$(this).val($(this).val() == $(this).attr("title") ? "" : $(this).val());
			});
	});
	$('#id_site').on('change', function() {
		if ($(this).val().length) {
			$("input[name='old_site'][value='0']").removeAttr('checked');
			$("input[name='old_site'][value='1']").attr('checked', 'checked');
			$("input[name='old_site']").change()
		} else {
			$("input[name='old_site'][value='1']").removeAttr('checked');
			$("input[name='old_site'][value='0']").attr('checked', 'checked');
			$('#old_site').slideUp('fast')
		}
	});
	$("input[name='old_site']").on('change', function() {
		if ($(this).val() * 1)
			$('#old_site').slideDown('fast')
		else
			$('#old_site').slideUp('fast')
	});
	var opener = 0;
	$('#togler').hover(function() {
		if (!opener) {
			var popup = "<div class='popup'>Заполнять не обязательно</div>";
			$(this).append(popup);
			$(this).find('.popup').fadeIn();
		}
	}, function() {
		if (!opener) {
			$(this).find('.popup').fadeOut('fast', function() {
				$(this).remove();
			});
		}
	}).on('click', function() {
		if (!opener) {
			opener = 1;
			$('#add_info').slideDown();
			$(this).text('Скрыть').prependTo('.row.up');
		} else {
			opener = 0;
			$('#add_info').slideUp();
			$(this).text('Расказать больше').prependTo('.row.down');
		}
	});
	$('.scroll .max, .scroll .min').on({
		mouseup : function() {
			$(document).unbind('mousemove');
		},
		mousedown : function(e) {
			var togler = $(this);
			var no = togler.parent().attr('id').replace('no', '') * 1;
			var absolute_pos = len.absolute[no];
			if (togler.is('.max'))
				var limiter = {
					input : $('.no' + no + ' input[id*=end]'),
					max : (len.max + absolute_pos),
					min : (absolute_pos + togler.parent().find('.min').position().left + 2)
				}
			else
				var limiter = {
					input : $('.no' + no + ' input[id*=start]'),
					max : (togler.parent().find('.max').position().left + absolute_pos - 2),
					min : (len.min + absolute_pos)
				}
			$(document).on({
				mousemove : function(ev) {
					var new_pos = ev.pageX - togler.width() / 2;
					if (limiter.max < new_pos)
						new_pos = limiter.max;
					if (limiter.min > new_pos)
						new_pos = limiter.min;
					var precent = (new_pos - absolute_pos - len.min) / len.width;

					console.log(precent, no);
					if (!no) {

						var value = 10 + 71.15294 * precent;

						if (value > 70)
							value = '';
					} else {
						var value = precent;
						if (precent < 0.5615)
							value = precent * 211;
						else if (precent < .704365)
							value = 120 + (precent - .5615) * 559.9692;
						else if (precent < .8392857)
							value = 200 + (precent - .704365) * 2223.528339;
						else if (precent < .954365)
							value = 500 + (precent - .8392857) * 100000;
						else
							value = '';
					}
					if (value)
						if (!no)
							value = value.toFixed(0)
						else if (value < 30)
							value = value.toFixed(0)
						else if (value < 120)
							value = (value / 5).toFixed(0) * 5;
						else if (value < 200)
							value = (value / 10).toFixed(0) * 10;
						else if (value < 500)
							value = (value / 50).toFixed(0) * 50;
						else if (value < 1500)
							value = (value / 100).toFixed(0) * 100;
						else 
							value = '';

					limiter.input.val(value);
					togler.offset({
						left : new_pos
					});
				},
				mouseup : function() {
					$(document).unbind('mousemove');
				}
			});
		}
	});
	$('#id_tz').on('change', function() {
		var input = $(this);
		$('label[for=' + input.attr('id') + ']').text(input.val().split('\\')[2]);
	});
	$("input[name='firm_file']").on('change', function() {
		var input = $(this);
		input.parent().clone(true).appendTo(input.parents('.file_list'))
		input.parent().removeClass('file_add').addClass('added').find('input').unbind('change').bind('change', function() {
			var new_input = $(this);
			$('label[for=' + new_input.attr('id') + ']').text(new_input.val().split('\\')[2]);
		}).attr('id', input.attr("id") + input.parent().index()).parent().find('label').text(input.val().split('\\')[2]).attr('for', input.attr("id")).parent().find('.del').on('click', function(e) {
			e.preventDefault();
			var del_butt = $(this);
			if (del_butt.parents('.file_list').find('.added').length == 1)
				input.parent().find('label span').text('файл');
			del_butt.parents('.added').slideUp(function() {
				$(this).remove();
			}).find('.del').remove();
		}).css('display', '').parents('added').clone(true).removeClass('added').appendTo(input.parents('.file_list'))
	});
	$('.add_site').on('click', function(e) {
		e.preventDefault();
		var site = $(this);
		site.css('display', 'none').parents('.site').find('.del_site, hr').css('display', '').filter('.del_site').unbind().on('click', function(ev) {
			ev.preventDefault();
			$(this).parents('.site').slideUp(function() {
				$(this).remove()
			})
		}).parents('.site').clone(true).css('display', 'none').appendTo(site.parents('.y_block')).slideDown().find('.add_site').css('display', '').parents('.site').find('.del_site, hr').css('display', 'none').parents('.site').find('input, textarea').val('').blur();
	});
}