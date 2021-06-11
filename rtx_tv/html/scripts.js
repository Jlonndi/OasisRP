var tvdata = {}

function closeMain() {
	$("body").css("display", "none");
}
function openMain() {
	$("body").css("display", "block");
}
$(".close").click(function(){
    $.post('http://rtx_tv/quit', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
	
	if (item.message == "showtvremote") {
		if (item.clear == true){
			$( ".home" ).empty()
			$('#tvmenu').show();
			tvdata = {}
		}
		openMain();
		$( ".home" ).append('<div class="tvinformations">' +
					'<div class="previewtext"><h4>Preview</div>' +
					'<iframe class="resp-iframe" id="previewvideo" width="500px" height="250px" src="" frameborder="0" allowfullscreen=""></iframe>' +
					'<div class="urlinput">' +
						'<input id="videourlid" placeholder="Video URL" type="text">' +
					'</div>' +	
					'<div class="textvolume">VOLUME</div>' +
					'<div class="volumechanging">' +
						'<div class="input">' +
							'<div class="label-value" name="' + item.tvdataid + '" data-legend="0"></div>' +
							'<div class="type-range">' +
								'<i class="fas fa-volume-down""style="color:#ffffff"></i>' +
								'<input value="' + item.tvdatavolume + '" name="' + item.tvdataid + '" id="volumerangenumber" type="range" class="volumechange" min="1" max="10">' +
								'<i class="fas fa-volume-up""style="color:#ffffff"></i>' +
							'</div>' +
						'</div>	' +
					'</div>	' +
					'<div class="container">' + 
						'<div class="buttontvplay">' + 
							'<div class="tvplaybutton" name="' + item.tvdataid + '"><i class="fas fa-play-circle""style="color:#ffffff"></i>&ensp;Play Video</div>' + 
						'</div>' +						
						'<div class="buttontvstartoff">' + 
							'<div class="tvstartoffbutton" name="' + item.tvdataid + '"><i class="fas fa-power-off"style="color:#ffffff"></i>&ensp;turn OFF the TV</div>' + 
						'</div>' +	
						'<div class="buttontvoff">' + 
							'<div class="syncbutton" name="' + item.tvdataid + '""><i class="fas fa-sync"style="color:#ffffff"></i>&ensp;Reload TV</div>' + 
						'</div>' +							
					'</div>' +
				'</div>');
		tvdata[item.tvdataid] = item.datatv;
	}	

	if (item.message == "changepreview") {
		document.getElementById('previewvideo').src = item.previewurl;
	}

	if (item.message == "hide") {
		closeMain();
	}

	$(document).ready(function(){
		$('.volumechanging input').change(function(){
			document.getElementById('volumerangenumber').name
			$.post('http://rtx_tv/changetvvolume', JSON.stringify({
				datatvid: document.getElementById('volumerangenumber').name,
				datatvvolume: document.getElementById('volumerangenumber').value
			}));		  

		});
	});
	
    document.onkeyup = function (data) {
        if (open) {
            if (data.which == 27) {
				$.post('http://rtx_tv/quit', JSON.stringify({}));
            }
        }	
	};
});

$(".home").on("click", ".tvstartoffbutton", function() {
	var $button = $(this);
	var $name = $button.attr('name')
	$.post('http://rtx_tv/turnofftv', JSON.stringify({
		datatv: tvdata[$name]
	}));
});


$(".home").on("click", ".syncbutton", function() {
	var $button = $(this);
	var $name = $button.attr('name')
	$.post('http://rtx_tv/synctv', JSON.stringify({
		datatv: tvdata[$name]
	}));
});

$(".home").on("click", ".tvplaybutton", function() {
	var $button = $(this);
	var $name = $button.attr('name')
	$.post('http://rtx_tv/playvideo', JSON.stringify({
		datatv: tvdata[$name],
		datatvurl: $("#videourlid").val().trim()
	}));
});

$(".urlinput input").on("focus",function(){
$(this).addClass("focus");
});

$(".urlinput input").on("blur",function(){
if($(this).val() == "")
$(this).removeClass("focus");
});
