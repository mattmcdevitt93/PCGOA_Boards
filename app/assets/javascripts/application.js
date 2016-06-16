// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
'use strict';

var Module = Module || {};

$(document).ready(function() {
	console.log('Ready!')
});

Module.Teamspeak3 = function () {

    $.ajax({
    	url:'https://api.planetteamspeak.com/serverstatus/voice.PCGOA.com:9987/',
    	success: function(data) {
    		console.log('AJAX Success', data);
    		var v = data.result;
    		if (v.online === true) {
    			console.log('TS Online');
    			$('#TS_icon').css('background-position', '-20px 0px');
    			$('#ts3status').append('Teamspeak 3 is Online.');
    			$('#TS_count').append('Online: ', v.users, ' / 32');
    		} else {
    			console.log('TS Offline');
    			$('#TS_icon').css('background-position', '-40px 0px');
    			$('#ts3status').append('Teamspeak 3 is Offline');
    		}
    	},
    	error: function(data) {
    		console.log('AJAX Fail', data);
    		$('#TS_icon').css('background-position', '-60px 0px');
    	},
    });

};