using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {

    var backgroundImage = null;

    function initialize() {
        backgroundImage = WatchUi.loadResource(Rez.Drawables.BackgroundImage);
    
        var dictionary = {
            :identifier => "Background"
        };
        Drawable.initialize(dictionary);
    }

    function draw(dc) {
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, Application.getApp().getProperty("BackgroundColor"));
        
        dc.clear();
        dc.drawBitmap(0, 0, backgroundImage);
    }

}
