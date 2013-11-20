/**
 * Created with JetBrains RubyMine.
 * User: weng
 * Date: 10/29/13
 * Time: 1:09 AM
 * To change this template use File | Settings | File Templates.
 */
jQuery(document).ready(function(){
    if(jQuery('#notice').text()==""){
        jQuery('#signIn').show()
        jQuery('#signOut').hide()
    }
    else{
        jQuery('#session_exist').show()
        jQuery('#signIn').hide()
        jQuery('#signOut').show()

    }

})