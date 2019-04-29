using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {

    var backgroundColor;
    var backgroundImage;
    var stepIcon;

    function initialize() {
        var themeNumber = Application.getApp().getProperty("Theme");
        
        backgroundImage = WatchUi.loadResource(Rez.Drawables.BackgroundImage);
        
        if (themeNumber == 0) {
            // Dark theme
            stepIcon = WatchUi.loadResource(Rez.Drawables.StepIconWhite);
            backgroundColor = Graphics.COLOR_BLACK;
        } else {
            // Light theme
            stepIcon = WatchUi.loadResource(Rez.Drawables.StepIconBlack);
            backgroundColor = Graphics.COLOR_WHITE;
        }
    
        var dictionary = {
            :identifier => "Background"
        };
        Drawable.initialize(dictionary);
    }

    function draw(dc) {
        // Set the background color then call to clear the screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, backgroundColor);
        dc.clear();
        
        dc.drawBitmap(0, 0, backgroundImage);
        dc.drawBitmap(40, 40, stepIcon);
    }

}
