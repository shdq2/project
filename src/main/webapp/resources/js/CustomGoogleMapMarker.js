function CustomMarker(latlng, map, args) {
	this.latlng = latlng;	
	this.args = args;	
	this.setMap(map);	
}

CustomMarker.prototype = new google.maps.OverlayView();

CustomMarker.prototype.draw = function() {
	
	var self = this;
	
	var div = this.div;
	
	if (!div) {
	
		div = this.div = document.createElement('div');
		
		div.className = 'marker';
		
		div.style.position = 'absolute';
		div.style.cursor = 'pointer';
		div.style.width = '100px';
		div.style.height = '30px';
		div.style.fontSize = '12px';
		div.style.color = 'white';
		div.style.textAlign = 'center';
		div.style.paddingTop = '2px';
		div.style.backgroundImage = 'url("/project/resources/imgs/price_marker.png")';
		div.style.backgroundSize = 'contain';
		div.style.backgroundRepeat = 'no-repeat';
		div.style.zIndex = self.args.marker_id;

		div.append(""+numberWithCommas(self.args.room_price));
		
		if (typeof(self.args.marker_id) !== 'undefined') {
			div.dataset.marker_id = self.args.marker_id;
		}
		
		var panes = this.getPanes();
		panes.overlayImage.appendChild(div);
	}
	
	var point = this.getProjection().fromLatLngToDivPixel(this.latlng);
	
	if (point) {
		div.style.left = (point.x - 50) + 'px';
		div.style.top = (point.y - 30) + 'px';
	}
};

CustomMarker.prototype.remove = function() {
	if (this.div) {
		this.div.parentNode.removeChild(this.div);
		this.div = null;
	}	
};

CustomMarker.prototype.getPosition = function() {
	return this.latlng;	
};

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}