// sacado de https://css-tricks.com/NetMag/FluidWidthVideo/Article-FluidWidthVideo.php

// Find all YouTube videos
var $allVideos = $("iframe[src^='https://player.vimeo.com'], iframe[src^='//www.youtube.com']"),

    // The element that is fluid width
    $fluidEl = $("article");

// Figure out and save aspect ratio for each video
$allVideos.each(function() {

    $(this)
        .data('aspectRatio', this.height / this.width)
    // and remove the hard coded width/height
        .removeAttr('height')
        .removeAttr('width');
});

// When the window is resized
$(window).resize(function() {
    console.log("la ventana cambio de tamaño!");

    var newWidth = $fluidEl.width();
    
    // Resize all videos according to their own aspect ratio
    $allVideos.each(function() {

        var $el = $(this);
        $el
            .width(newWidth)
            .height(newWidth * $el.data('aspectRatio'));
        
    });
    
    // Kick off one resize to fix all videos on page load
}).resize();
