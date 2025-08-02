//a

// Thanks to Haven (aliza as of rn) for making this like years ago :sob:
// Modified by ItsLJcool

import StringTools;

public var noteCamIntensity:Float = 1;
public var _singPosMap:Map<String, {x:Float, y:Float}> = [
	'singLEFT' => {x: -25, y: 0}
	'singLEFT-alt' => {x: -25, y: 0}
	'singDOWN' => {x: 0, y: 25}
	'singDOWN-alt' => {x: 0, y: 25}
	'singUP' => {x: 0, y: -25}
	'singUP-alt' => {x: 0, y: -25}
	'singRIGHT' => {x: 25, y: 0}
	'singRIGHT-alt' => {x: 25, y: 0}
];

public var disable_camera_movement:Bool = false;

// return; // Uncomment this to disable the camera movement for the mod. We keep the variables above so that events don't break.

function onCameraMove(e) {
	var addon = {x: 0, y: 0};
	
	var _anim:String = strumLines.members[curCameraTarget].characters[0].getAnimName();
	var singAnims = [for (_i in _singPosMap.keys()) _i];
	if (singAnims.contains(_anim)) {
		addon.x += _singPosMap[_anim].x*noteCamIntensity;
		addon.y += _singPosMap[_anim].y*noteCamIntensity;
	}

	PlayState.instance.scripts.call("onCameraNoteMove", [e, addon]);

	if (disable_camera_movement || e.cancelled) return;
	e.position.x += addon.x;
	e.position.y += addon.y;
}

function create() {
	for(e in events) {
		if (e.time > 10) break;
		if (e.name != "Camera Movement") continue;
		var char = strumLines.members[event.params[0]].characters[0];
		camFollow.setPosition(char.getCameraPosition().x, char.getCameraPosition().y);
		FlxG.camera.focusOn(camFollow.getPosition());
		
		return;
	}
	// if the camera movement event wasn't found:

	camFollow.setPosition(dad.getCameraPosition().x, dad.getCameraPosition().y);
	FlxG.camera.focusOn(camFollow.getPosition());
}

function postCreate() {
	onPostStartCountdown();
}

function onPostStartCountdown() {
    FlxG.camera.zoom = defaultCamZoom;
}