/*
goo specific stuff was added here because i didn't like the stage file being so damn big
and also the quote tweens are still broken oops!
it's 12 30 am im tired
*/
//imports
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;

function create(){camHUD.alpha = 0;}
//kino fade in intro
introLength = 0;
function onCountdown(event){event.cancel();
camera.fade(FlxColor.BLACK, 0.01);}

function onSongStart(){camera.fade(FlxColor.BLACK, 7.75, true);}

function beatHit(){
switch(curBeat){
case 15: FlxTween.tween(camHUD, {alpha: 1}, 0.5, {ease: FlxEase.linear});
case 112: funnyBars();
case 144: funnyBarsOff();
case 224: camGame.alpha = camHUD.alpha = 0;
case 226: peace();
case 227: quote1(); 
case 229: quote2(); 
}}

function stepHit(curStep:Int){switch(curStep){case 942: bossJumpscare();}}

function postCreate(){
//kino text
prostate = new FlxText(1280, 100);
prostate.cameras = [camHUD];
prostate.setFormat(Paths.font("vcr.ttf"), 48, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, 0xFF000000);
prostate.text = 'kino.hx ACTIVATED';
prostate.width = 100;
prostate.antialiasing = false;
prostate.updateHitbox();
prostate.screenCenter();
prostate.borderSize = 3;
prostate.visible = false;
add(prostate);

//you know whats crazy? that low taper fade meme is still MASSIVE dude. massive. IT IS!
barTop = new FlxSprite().makeGraphic(Std.int(FlxG.width * 2), Std.int(68), FlxColor.BLACK);
barTop.screenCenter(FlxAxes.X);
barTop.cameras = [camHUD];
barTop.y = 0 - barTop.height;
barBottom = new FlxSprite().makeGraphic(Std.int(FlxG.width * 2), Std.int(68), FlxColor.BLACK);
barBottom.screenCenter(FlxAxes.X);
barBottom.cameras = [camHUD];
barBottom.y = 652 + barBottom.height; //652
insert(getObjectOrder(healthBarBG) - 12, barTop);
insert(getObjectOrder(healthBarBG) - 12, barBottom);
add(barTop);
add(barBottom);}

//funny bar functions
function funnyBars() {
FlxTween.tween(barTop, {y: 0}, 1, {ease: FlxEase.expoOut});
FlxTween.tween(barBottom, {y: 652}, 1, {ease: FlxEase.expoOut});
prostate.visible = true;
FlxFlicker.flicker(prostate, 2, 0.25, false);}
function funnyBarsOff(){
FlxTween.tween(barTop, {y: 0 - 68}, 1, {ease: FlxEase.expoOut});
FlxTween.tween(barBottom, {y: 652 + 68}, 1, {ease: FlxEase.expoOut});}
//thing for bars behind hud
function getObjectOrder(obj:Dynamic){
return PlayState.instance.members.indexOf(obj);}