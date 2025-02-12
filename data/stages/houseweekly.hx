import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;

var bfjumpscare:FlxSprite;
var barTop:FlxSprite;
var barBottom:FlxSprite;
var prostate:FlxText;
var kinoTween:FlxTween;
var path1:String = 'bg/tweaking/';
var path2:String = 'bg/tweaking/weeklyMix/';
function postCreate(){
//bg size
bg.setGraphicSize(bg.width * 1.75);

//bf jumpscare
bfjumpscare = new FlxSprite(0, 0).loadGraphic(Paths.image(path1 + "jumpscare!"));
bfjumpscare.cameras = [camHUD];
bfjumpscare.alpha = 0;
bfjumpscare.scale.set(2,2);
bfjumpscare.updateHitbox();
add(bfjumpscare);

//quote stuff for goo
quoteBG = new FlxSprite(20, 0).loadGraphic(Paths.image(path2 + "dontTweaklilfella"));
quoteBG.cameras = [camHUD];
quoteBG.scale.set(1.05, 1);
quoteBG.alpha = 0;
add(quoteBG);

quote1 = new FlxSprite(0, 0).loadGraphic(Paths.image(path2 + "quote1"));
quote1.cameras = [camHUD];
quote1.alpha = 0;
add(quote1);

quote2 = new FlxSprite(500, 300).loadGraphic(Paths.image(path2 + "quote2"));
quote2.cameras = [camHUD];
quote2.alpha = 0;
add(quote2);
//ahhh!!
bossjumpscare = new FlxSprite(0, 0).loadGraphic(Paths.image(path2 + "bossjumpscare"));
bossjumpscare.cameras = [camHUD];
bossjumpscare.alpha = 0;
add(bossjumpscare);

//you knows what crazy? that low taper fade meme is still MASSIVE dude. massive. IT IS!
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
add(barBottom);

//kino text
prostate = new FlxText(1280, 100);
prostate.cameras = [camHUD];
prostate.setFormat(Paths.font("vcr.ttf"), 48);
prostate.text = 'kino.hx ACTIVATED';
prostate.alignment = FlxTextAlign.CENTER;
prostate.borderStyle = FlxTextBorderStyle.OUTLINE;
prostate.color = 0xFFFFFFFF;
prostate.borderColor = 0xFF000000;
prostate.width = 100;
prostate.antialiasing = false;
prostate.updateHitbox();
prostate.screenCenter();
prostate.borderSize = 3;
prostate.visible = false;
add(prostate);
}

//jumpscare function
public function bfJumpscare(){
bfjumpscare.alpha = 1;
new FlxTimer().start(0.1, function(tmr:FlxTimer){
bfjumpscare.alpha = 0;});}
//funny goo weekly functions
public function bossJumpscare(){
bossjumpscare.alpha = 1;}
public function peace(){
FlxTween.tween(quoteBG, {alpha: 1}, 7.5, {ease: FlxEase.expoOut});}
//something about these is weird i feel like but im so tired im not working on this no more
public function quote1(){
FlxTween.tween(quote1, {alpha: 1}, 7.5, {ease: FlxEase.expoOut});}
public function quote2(){
FlxTween.tween(quote2, {alpha: 1}, 8.5, {ease: FlxEase.expoOut});}
//funny bar functions
public function funnyBars() {
FlxTween.tween(barTop, {y: 0}, 1, {ease: FlxEase.expoOut});
FlxTween.tween(barBottom, {y: 652}, 1, {ease: FlxEase.expoOut});
prostate.visible = true;
FlxFlicker.flicker(prostate, 2, 0.25, false);}
public function funnyBarsOff(){
FlxTween.tween(barTop, {y: 0 - 68}, 1, {ease: FlxEase.expoOut});
FlxTween.tween(barBottom, {y: 652 + 68}, 1, {ease: FlxEase.expoOut});}
//thing for bars behind hud
function getObjectOrder(obj:Dynamic) {
return PlayState.instance.members.indexOf(obj);}

/*
i wanted to do icon bop stuff here but i just couldn't figure it out
*/