using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.ActivityMonitor;
using Toybox.Time;

class WatchTestView extends WatchUi.WatchFace {

    var color;

    function initialize() {
        WatchFace.initialize();
        
        var themeNumber = Application.getApp().getProperty("Theme");
        if (themeNumber == 0) {
            // Dark theme
            color = Graphics.COLOR_WHITE;
        } else {
            // Light theme
            color = Graphics.COLOR_BLACK;
        }
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Get the current time and format it correctly
        var clockTime = System.getClockTime();
        
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour && hours > 12) {
            hours = hours - 12;
        }
        var timeString = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
        
        // Get the current date and format it correctly
        var date = Time.Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var dateString = Lang.format("$1$ $2$", [date.day_of_week, date.day]);
        

        // Update the view
        var view = View.findDrawableById("TimeLabel");
        view.setColor(color);
        view.setText(timeString);
        
        var stepsLabel = View.findDrawableById("StepLabel");
        stepsLabel.setColor(color);
        var stepCount = ActivityMonitor.getInfo().steps;
        stepsLabel.setText(stepCount.format("%d"));
        
        var dateLabel = View.findDrawableById("DateLabel");
        dateLabel.setColor(color);
        dateLabel.setText(dateString);
        

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
