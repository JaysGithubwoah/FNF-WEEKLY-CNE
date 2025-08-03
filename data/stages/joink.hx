import funkin.backend.utils.WindowUtils;
import lime.graphics.Image;
import funkin.backend.utils.ShaderResizeFix;
import funkin.backend.system.framerate.Framerate;
import openfl.system.Capabilities;

var doCameraForce:Bool = true;
var forceCamZoomingOff:Bool = false;

function new(){
	windowShit(960, 720, 0.85);
}

function postCreate(){
   dad.moves = true;
   forcedCameraPos = true;
   FlxG.camera.followLerp = 0;
   camGame.scroll.x = 230;
   camGame.scroll.y = 80;
}

//bro fix this shit it puts a black box on my screen when i exit the song

function destroy()
   windowShit(1280, 720, 1);

public static function windowShit(newWidth:Int, newHeight:Int, ?winScale:Float = 0.9){
	if(newWidth != 1280 || newHeight != 720) {
	   aspectShit(newWidth, newHeight);
	   FlxG.resizeWindow(winWidth * winScale, winHeight * winScale);
   } else
	   FlxG.resizeWindow(newWidth, newHeight);
   FlxG.resizeGame(newWidth, newHeight);
   FlxG.scaleMode.width = FlxG.width = FlxG.initialWidth = newWidth;
   FlxG.scaleMode.height = FlxG.height = FlxG.initialHeight = newHeight;
   ShaderResizeFix.doResizeFix = true;
   ShaderResizeFix.fixSpritesShadersSizes();
   window.x = Capabilities.screenResolutionX/2 - window.width/2;
   window.y = Capabilities.screenResolutionY/2 - window.height/2;
}

function aspectShit(width:Int, height:Int):String {
   var idk1:Int = height;
   var idk2:Int = width;
   while (idk1 != 0) {
       idk1 = idk2 % idk1;
       idk2 = height;
   }
   winWidth = Math.floor(Capabilities.screenResolutionX * ((height / idk2) / (width / idk2))) > Capabilities.screenResolutionY ? Math.floor(Capabilities.screenResolutionY * ((width / idk2) / (height / idk2))) : Capabilitities.screenResolutionX;
   winHeight = Math.floor(Capabilities.screenResolutionX * ((height / idk2) / (width / idk2))) > Capabilities.screenResolutionY ? Capabilities.screenResolutionY : Math.floor(Capabilities.screenResolutionX * ((height / idk2) / (width / idk2)));
}

function onCameraMove(e) if (doCameraForce) camGame.scroll.x = (curCameraTarget == 0 ? 560 : -130);
function onNoteHit(event) {if (forceCamZoomingOff) event.enableCamZooming = false;}
function update(e) if (forceCamZoomingOff) camHUD.zoom = lerp(camHUD.zoom, defaultHudZoom, camHUDZoomLerp);