! function(name, definition) {
  if (typeof module != 'undefined' && module.exports) module.exports = definition();
  else if (typeof define == 'function') define(definition);
  else this[name] = definition();
}('sticky', function() {

  return function sticky(el, top) {

    var requiredOriginalStyles = ['position', 'top', 'left', 'width', 'bottom', 'padding-top', 'padding-bottom', 'font-size', 'z-index'];

    var requiredTop = top || 0;
    var originalRect = calcRect(el);
    var originalClass = el.className;
    var styles = {
      position: 'fixed',
      top: requiredTop + 'px',
      left: originalRect.left + 'px',
      width: originalRect.width + 'px',
      bottom: 'auto',
      "padding-top": '10px',
      'padding-bottom': '10px',
      'font-size': '20px',
      'z-index': 9999
    }
    var originalStyles = {}
    requiredOriginalStyles.forEach(function(key) {
      originalStyles[key] = el.style[key];
    });

    var onscroll;
    if (window.onscroll) {
      onscroll = window.onscroll;
    }

    window.onscroll = function(event) {
      if (getWindowScroll().top > originalRect.top - requiredTop) {
        // for (key in styles) {
        //   el.style[key] = styles[key];
        // }
        el.className = originalClass + ' sticky-nav'
      } else {
        // for (key in originalStyles) {
        //   el.style[key] = originalStyles[key];
        // }

        el.className = originalClass;

      }
      onscroll && onscroll(event)
    }
  }

  function calcRect(el) {
    var rect = el.getBoundingClientRect();
    var windowScroll = getWindowScroll()
    return {
      left: rect.left + windowScroll.left,
      top: rect.top + windowScroll.top,
      width: rect.width,
      height: rect.height
    }
  }

  function getWindowScroll() {
    return {
      top: window.pageYOffset || document.documentElement.scrollTop,
      left: window.pageXOffset || document.documentElement.scrollLeft
    }
  }

});
