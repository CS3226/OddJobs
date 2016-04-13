document.addEventListener('DOMContentLoaded', fn, false);

function fn() {
	setTimeout( function() {
		temp = document.getElementById("filter-radio-group");
		if (temp != null) {
			show_all_radio_button = document.getElementById("filter-radio-group").childNodes[1];
			show_all_radio_button.click();
		}
	}, 500 );

	function filter_listings() {
		selected_category = document.getElementsByClassName("md-checked")[0].attributes["value"].value;
		listings = document.getElementsByClassName("filter");

		if (typeof listings !== 'undefined') {
			for (i = 0; i < listings.length; i++) {
				listings[i].style.display = "none";
			}
		}

		listings_to_show = document.getElementsByClassName(selected_category);
		if (typeof listings_to_show !== 'undefined') {
			for (i = 0; i < listings_to_show.length; i++) {
				listings_to_show[i].style.display = "block";
			}
		}
	} 

	filter_radio_group = document.getElementById("filter-radio-group");
	if (filter_radio_group != null) {
		filter_radio_group.addEventListener("click", filter_listings);
	}
}
