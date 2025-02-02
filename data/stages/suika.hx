var doCameraForce:Bool = true;
var forceCamZoomingOff:Bool = false;

function postCreate(){

   forcedCameraPos = true;
   FlxG.camera.followLerp = 0;
   camGame.scroll.x = 230;
   camGame.scroll.y = 10;

   healthBar.angle = 90;
   healthBarBG.angle = 90;

   healthBar.x = -190;
   healthBar.y = 380;
   healthBarBG.x = -193.5;
   healthBarBG.y = 375;
   iconP1.y += 10;
   iconP1.x += 10;
}

function onCameraMove(e) if (doCameraForce) camGame.scroll.x = (curCameraTarget == 0 ? 10 : 10);
function onNoteHit(event) {
    if (forceCamZoomingOff) event.enableCamZooming = false;
}

function update(e) if (forceCamZoomingOff) camHUD.zoom = lerp(camHUD.zoom, defaultHudZoom, camHUDZoomLerp);

function postUpdate(elapsed){
    
    iconP1.x = 40;
    iconP1.y = 570;

    iconP2.x = 35;
    iconP2.y = 20;

}
