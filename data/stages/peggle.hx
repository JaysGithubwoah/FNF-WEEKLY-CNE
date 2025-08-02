import flixel.text.FlxTextBorderStyle;
import openfl.text.TextFormat;
var doCameraForce:Bool = true;
var forceCamZoomingOff:Bool = false;
function create() {
gf.alpha = 0;
dad.alpha = 0;
//camera for da shite
camOther = new FlxCamera(0, 0);
camOther.bgColor = FlxColor.TRANSPARENT;
FlxG.cameras.remove(camHUD, false);
FlxG.cameras.add(camOther, false);
FlxG.cameras.add(camHUD, false);
}

function postCreate(){
   scoreTxt.setFormat("fonts/vcr.ttf", 30, FlxColor.CYAN, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
   scoreTxt.x += 340;
   scoreTxt.y = -12;

   accuracyTxt.setFormat("fonts/vcr.ttf", 10, FlxColor.CYAN, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
   accuracyTxt.x -= 20;
   accuracyTxt.y = 17;

   missesTxt.setFormat("fonts/vcr.ttf", 15, FlxColor.CYAN, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
   missesTxt.x -= 100;
   missesTxt.y = 26.5;

   healthBarBG.cameras = [camOther];
   healthBar.cameras = [camOther];
   border.cameras = [camOther];

   forcedCameraPos = true;
   FlxG.camera.followLerp = 0;
   camGame.scroll.x = 230;
   camGame.scroll.y = 10;

   healthBar.angle = 90;
   healthBarBG.angle = 90;

   healthBar.x = -123;
   healthBar.y = 400;
   healthBarBG.x = healthBar.x - 3;
   healthBarBG.y = healthBar.y - 3;
   if (downscroll){healthBar.x = -123; healthBar.y = 400; healthBarBG.x = healthBar.x - 4; healthBarBG.y = healthBar.y - 2;
   //fix me.
   //later..
   missesTxt.x -= 100;
   missesTxt.y += 1;
   accuracyTxt.x -= 20;
   accuracyTxt.y += 28;
   scoreTxt.x += 340;
   scoreTxt.y -= 12;}

   iconP1.visible = iconP2.visible = false;
}

function onCameraMove(e) if (doCameraForce) camGame.scroll.x = (curCameraTarget == 0 ? -50 : -50);
function onNoteHit(event) {if (forceCamZoomingOff) event.enableCamZooming = false;}
function update(e) if (forceCamZoomingOff) camHUD.zoom = lerp(camHUD.zoom, defaultHudZoom, camHUDZoomLerp);
function onDadHit(e){e.healthGain = -0.035;}
function onPlayerHit(e){e.healthGain = 0;}

var freakbobiscalling = true;
function postUpdate(elapsed:Float){
if (!freakbobiscalling) return;
var anim = strumLines.members[1].characters[0].getAnimName();
var anim2 = strumLines.members[1].characters[0].getAnimName();
switch(anim){case "singLEFT": boyfriend.flipX = false;}
switch(anim2){case "singRIGHT": boyfriend.flipX = true;}

//help
   scoreTxt.text = CoolUtil.addZeros(songScore, 6);
   //accuracyTxt.text = accuracy;
   missesTxt.text = misses;
}