var doCameraForce:Bool = true;
var forceCamZoomingOff:Bool = false;

function postCreate(){

   forcedCameraPos = true;
   FlxG.camera.followLerp = 0;
   camGame.scroll.x = 230;
   camGame.scroll.y = 10;

   healthBar.angle = 90;
   healthBarBG.angle = 90;

   healthBar.x = -101;
   healthBar.y = 380;
   healthBarBG.x = -104;
   healthBarBG.y = 375;
   
   iconP1.visible = iconP2.visible = false;
}

function onCameraMove(e) if (doCameraForce) camGame.scroll.x = (curCameraTarget == 0 ? -50 : -50);
function onNoteHit(event) {
    if (forceCamZoomingOff) event.enableCamZooming = false;
}

function update(e) if (forceCamZoomingOff) camHUD.zoom = lerp(camHUD.zoom, defaultHudZoom, camHUDZoomLerp);

function onDadHit(e){
    health = health + 0.05;
}

function onDadHit(e){
    boyfriend.flipX = true;
}
