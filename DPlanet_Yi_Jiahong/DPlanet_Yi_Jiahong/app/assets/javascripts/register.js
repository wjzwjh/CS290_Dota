/**
 * Created with JetBrains RubyMine.
 * User: weng
 * Date: 10/25/13
 * Time: 9:40 PM
 * To change this template use File | Settings | File Templates.
 */

jQuery(document).ready(function () {
    jQuery('#userName').blur(function() {
        jQuery.ajax({
            type: "get",
            url: '/users/checkName',
            data:  {userName :jQuery('#userName').val()},
            success: function (response,status) {
                jQuery('#badUserName').hide()
                jQuery('#goodUserName').show()
                jQuery('#submit').attr("disabled" ,false)
            },
            error: function (response,status) {
                jQuery('#badUserName').show()
                jQuery('#goodUserName').hide()
                jQuery('#submit').attr("disabled" ,true)
            }
        });
//        jQuerythis = jQuery(this);
//        jQuery.get(jQuerythis.data('validate'), {
//            user: jQuerythis.val()
//        }).success(function() {
//                jQuery('#badUserName').hide()
//                jQuery('#goodUserName').show()
//                jQuery('#submit').attr("disabled" ,false)
////                    jQuerythis.removeClass('field_with_errors');
//            }).error(function() {
//                jQuery('#goodUserName').hide()
//                jQuery('#badUserName').show()
//
//                jQuery('#submit').attr("disabled" ,true)
////                    jQuerythis.addClass('field_with_errors');
//            });
    });

    jQuery('#password').change(function(){
        var pattern = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/
        if(pattern.test(jQuery('#password').val())){
            jQuery('#patternWrongPwd').hide()
            if(jQuery('#confirmInput').val()=='')
                jQuery('#submit').attr("disabled" ,true)

        }
        else{

            jQuery('#patternWrongPwd').show()
            jQuery('#submit').attr("disabled" ,true)

        }

    })

    jQuery('#confirmInput').change(function(){
        if(jQuery('#patternWrongPwd').is(":visible")) return;


        if(jQuery('#password').val() =='' ){
            jQuery('#mismatchPwd').hide();
            jQuery('#emptyPwd').show();
            jQuery('#submit').attr("disabled" ,true)
        }

        else if(jQuery('#password').val() != jQuery('#confirmInput').val()){
            jQuery('#mismatchPwd').show();
            jQuery('#rightPwd').hide();
            jQuery('#emptyPwd').hide();
            jQuery('#submit').attr("disabled" ,true)
        }
        else{
            jQuery('#submit').attr("disabled" ,false)
            if( jQuery('#badUserName').is(":visible")) {
                jQuery('#submit').attr("disabled" ,true)
            }
            jQuery('#mismatchPwd').hide();
            jQuery('#emptyPwd').hide();
            jQuery('#rightPwd').show();
        }

    });
});
