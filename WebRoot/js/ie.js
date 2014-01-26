var rotate = (function() {  
    switch (UA.core) {  
    case 'trident' :  
        return UA.ie < 9 ?  function(dom, angle) {  
            var rad = angle * (Math.PI / 180),  
            filter = dom.filters.item('DXImageTransform.Microsoft.Matrix');  
            filter.Dx = (1 - Math.cos(Math.PI / 4 + rad) / Math.cos(Math.PI / 4)) * 0.5 * (dom.offsetWidth - 1);  
            filter.Dy = (1 - Math.sin(Math.PI / 4 + rad) / Math.cos(Math.PI / 4)) * 0.5 * (dom.offsetHeight - 1);  
            filter.M11 = Math.cos(rad);  
            filter.M12 = -1 * Math.sin(rad);  
            filter.M21 = Math.sin(rad);  
            filter.M22 = filter.M11;  
            filter.Enabled = true;  
        } : 
        	 function(dom, angle) {  
            dom.style.msTransform = 'rotate(' + angle + 'deg)';  
        }; 
    case 'webkit' :  
        return function(dom, angle) {  
            dom.style.webkitTransform = 'rotate(' + angle + 'deg)';  
        };  
    case 'gecko' :  
        return function(dom, angle) {  
            dom.style.MozTransform = 'rotate(' + angle + 'deg)';  
        };  
    case 'presto' :  
        return function(dom, angle) {  
            dom.style.OTransform = 'rotate(' + angle + 'deg)';  
        };  
    default:  
        return function(dom, angle) {  
            dom.style.transform = 'rotate(' + angle + 'deg)';  
        };  
    }  
})(); 