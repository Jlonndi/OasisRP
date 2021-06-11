function close() {
    $(".crosshair").removeClass('active');
    $(".menu").removeClass('fadeIn');
    $.post('http://rcore_hotel/close', JSON.stringify({}))
}

var app = new Vue({
    el: '#app',
    data: {
        visible: false,
        menu: {}
    },
    methods: {
        onClick: function (itemName) {
            $.post('http://rcore_hotel/click', JSON.stringify({
                item: itemName
            }), (data) => {
                if (data === 'ok') {
                    close()
                } else if (data === 'persist') {
                    $('.' + itemName).addClass('animate__animated animate__bounce')
                    setTimeout(function () {
                        $('.' + itemName).removeClass('animate__animated animate__bounce')
                    }, 1000)
                }
            });
        }
    },
    computed: {}
});

$(document).ready(function () {
    window.addEventListener('message', function (event) {

        if (event.data.menu) {
            if (event.data.action == 'turnoff') {
                $(".crosshair").removeClass('active');
                $(".menu").removeClass('fadeIn');
            }

            if (event.data.action == 'turnon') {
                app.menu = event.data.menu;
                $(".crosshair").addClass('active');
                $(".menu").addClass('fadeIn');
            }
        }

    });

    var closeKeys = [27, 8];

    $(document.body).bind("keyup", function (key) {
        if (closeKeys.includes(key.which)) {
            close()
        }
    });

});
