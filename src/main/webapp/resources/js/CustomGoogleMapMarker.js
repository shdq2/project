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
		div.style.backgroundSize = 'contain';
		div.style.backgroundRepeat = 'no-repeat';

		div.append(""+numberWithCommas(self.args.room_price));
		
		if (typeof(self.args.marker_id) !== 'undefined') {
			div.dataset.marker_id = self.args.marker_id;
		}

		if (typeof(self.args.z_index) !== 'undefined') {
			div.style.zIndex = self.args.z_index;
		}
		
		if (typeof(self.args.room_code) !== 'undefined') {
			div.dataset.room_code = self.args.room_code;
		}
		
		if (typeof(self.args.bg_image) !== 'undefined') {
			div.style.backgroundImage = self.args.bg_image;
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