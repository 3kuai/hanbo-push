var site = "http://127.0.0.1/pushAdmin";
(function () {
    'use strict';

    // Placeholder
    var placeholderFunction = function () {
        $('input, textarea').placeholder({customClass: 'my-placeholder'});
    }

    // Placeholder
    var contentWayPoint = function () {
        var i = 0;
        $('.animate-box').waypoint(function (direction) {

            if (direction === 'down' && !$(this.element).hasClass('animated-fast')) {

                i++;

                $(this.element).addClass('item-animate');
                setTimeout(function () {

                    $('body .animate-box.item-animate').each(function (k) {
                        var el = $(this);
                        setTimeout(function () {
                            var effect = el.data('animate-effect');
                            if (effect === 'fadeIn') {
                                el.addClass('fadeIn animated-fast');
                            } else if (effect === 'fadeInLeft') {
                                el.addClass('fadeInLeft animated-fast');
                            } else if (effect === 'fadeInRight') {
                                el.addClass('fadeInRight animated-fast');
                            } else {
                                el.addClass('fadeInUp animated-fast');
                            }

                            el.removeClass('item-animate');
                        }, k * 200, 'easeInOutExpo');
                    });

                }, 100);

            }

        }, {offset: '85%'});
    };

    $.fn.serializeJson = function () {
        var serializeObj = {};
        var array = this.serializeArray();
        var str = this.serialize();
        $(array).each(function () {
            if (serializeObj[this.name]) {
                if ($.isArray(serializeObj[this.name])) {
                    serializeObj[this.name].push(this.value);
                } else {
                    serializeObj[this.name] = [serializeObj[this.name], this.value];
                }
            } else {
                serializeObj[this.name] = this.value;
            }
        });
        return serializeObj;
    };

    // On load
    $(function () {
        if (localStorage.getItem("token") && localStorage.getItem("token") != "undefined") {
            $("#mainPage").load("main.html");
            return;
        }
        placeholderFunction();
        contentWayPoint();

        $("#registerBtn").bind("click", function () {
            debugger
            var data = $("#regForm").serializeJson();
            $.ajax({
                url: site + "/developer/reg",
                data: JSON.stringify(data),
                dataType: "json",
                type: "post",
                contentType: "application/json",
                async: true,
                success: function (cb) {
                    if (cb && cb.code == "0000") {
                        debugger
                        localStorage.setItem("token", cb.data.id);
                        localStorage.setItem("currentUser", data.userName);
                        $("#mainPage").load("main.html");
                    }
                }
            })
        });

        $("#loginBtn").bind("click", function () {
            var data = $("#loginForm").serializeJson();
            $.ajax({
                url: site + "/developer/login",
                data: JSON.stringify(data),
                dataType: "json",
                type: "post",
                contentType: "application/json",
                success: function (cb) {
                    if (cb && cb.code == "0000") {
                        localStorage.setItem("appList", JSON.stringify(cb.data.appEntitySet));
                        localStorage.setItem("token", cb.data.id);
                        localStorage.setItem("currentUser", data.userName);
                        $("#mainPage").load("main.html");
                    }
                    else {
                        $("#showMsg").empty();
                        $("#showMsg").html("用户名或者密码错误");
                    }
                }
            })
        });

        $("#signUp").click("click", function () {
            $("#loginForm").css("display", "none");
            $("#regForm").css("display", "");
        });

    });
}());