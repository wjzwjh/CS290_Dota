window.fbAsyncInit = function() {

    var  appId = '142776242496903';

    FB.init({
        appId      : appId,
        status     : true,
        cookie     : true,
        xfbml      : true,
        oauth      : true,
    });
};
(function(d){
    var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
    js = d.createElement('script'); js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    d.getElementsByTagName('head')[0].appendChild(js);
}(document));

//$(document).ready(function(){
//
//
//    FB.getLoginStatus(function(response){
//        if(response.status === 'connected'){ //already logged in and authorized
//            var uid = response.authResponse.userID,
//                accessToken = response.authResponse.accessToken;
////            alert(uid)
//            $.ajax({
//                url: "http://graph.facebook.com/"+uid+"/picture?type=large&redirect=false",
//                type:"get", //send it through get method
//                success: function(response) {
//                    $("#thumbnail").show()
//                     $("#thumbnail").attr('src',response.data.url)
////                      $("<%#= escape_javascript(render @products) %>").appendTo(".entry");
//                },
//                error: function(xhr) {
//                    //Do Something to handle error
//                }
//            });
//
////            loginWithFB(accessToken);
//        }
//        else{ //not logged in/authorized, do login
//            FB.login(function(response){
//                if(response.authResponse){
//
//
////                    loginWithFB(accessToken);
//                }
//                else{
//                    //console.log('User cancelled login or did not fully authorize.');
//                }
//            }, { scope : 'email' });
//        }
//    });
//});
