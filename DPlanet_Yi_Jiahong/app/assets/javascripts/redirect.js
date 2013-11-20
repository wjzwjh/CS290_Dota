/**
 * Created with JetBrains RubyMine.
 * User: weng
 * Date: 10/25/13
 * Time: 9:42 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){
   var pattern =    /\d$/

   if (pattern.test(location.href)&& location.href.indexOf('user')!= -1){
    delayURL('/home')
   }
   else return
})


//delayURL('/users/register')

function delayURL(url) {
    var delay = $('#time').text();
    if(delay > 0) {
        delay--;
        $('#time').text(delay);
    }
    else{

        window.top.location.href = url;
    }
    setTimeout("delayURL('" + url + "')", 1000);
}