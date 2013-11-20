/**
 * Created with JetBrains RubyMine.
 * User: weng
 * Date: 10/29/13
 * Time: 4:25 AM
 * To change this template use File | Settings | File Templates.
 */
    jQuery('document').ready(function(){
        if(jQuery('#text').text()!= "") {
            jQuery('#welcomeUser').show()
            jQuery('#notSignIn').hide()
            jQuery('#signOutNow').show()
        }
        else{
            jQuery('#notSignIn').show()
            jQuery('#welcomeUser').hide()
//            jQuery('#signOut').hide()

        }
    })