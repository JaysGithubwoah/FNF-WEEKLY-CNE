//sprite vars
var bfjumpscare:FlxSprite;
var barTop:FlxSprite;
var barBottom:FlxSprite;
var prostate:FlxText;
var kinoTween:FlxTween;
//pathing
var path1:String = 'bg/tweaking/';
var path2:String = 'bg/tweaking/weeklyMix/';
//zoom vars
var zoom = 0.35;
var zoom2 = 0.2;

function onPlayerHit(event:NoteHitEvent){
event.ratingScale = zoom * 1;
//little numbers dont show up
minDigitDisplay = 99999;}

function create(){
//camera for da shite
camOther = new FlxCamera(0, 0);
camOther.bgColor = FlxColor.TRANSPARENT;
FlxG.cameras.add(camOther, false);

//bf jumpscare
bfjumpscare = new FlxSprite(0, 0).loadGraphic(Paths.image(path1 + "jumpscare!"));
bfjumpscare.cameras = [camOther];
bfjumpscare.alpha = 0;
bfjumpscare.scale.set(2,2);
bfjumpscare.updateHitbox();
add(bfjumpscare);

//quote stuff for goo
quoteBG = new FlxSprite(20, 0).loadGraphic(Paths.image(path2 + "dontTweaklilfella"));
quoteBG.cameras = [camOther];
quoteBG.scale.set(1.05, 1);
quoteBG.alpha = 0;
add(quoteBG);

quote1 = new FlxSprite(0, 0).loadGraphic(Paths.image(path2 + "quote1"));
quote1.cameras = [camOther];
quote1.alpha = 0;
add(quote1);

quote2 = new FlxSprite(500, 300).loadGraphic(Paths.image(path2 + "quote2"));
quote2.cameras = [camOther];
quote2.alpha = 0;
add(quote2);

//ahhh!!
bossjumpscare = new FlxSprite(0, 0).loadGraphic(Paths.image(path2 + "bossjumpscare"));
bossjumpscare.cameras = [camOther];
bossjumpscare.alpha = 0;
add(bossjumpscare);}

//jumpscare function
public function bfJumpscare(){bfjumpscare.alpha = 1;
new FlxTimer().start(0.1, function(tmr:FlxTimer){bfjumpscare.alpha = 0;});}

//funny goo weekly functions
public function bossJumpscare(){bossjumpscare.alpha = 1;}
public function peace(){FlxTween.tween(quoteBG, {alpha: 1}, 7.5, {ease: FlxEase.expoOut});}

//better now
public function quoteTween(){FlxTween.tween(quote1, {alpha: 1}, 2, {ease: FlxEase.linear, onComplete: () -> {
FlxTween.tween(quote2, {alpha: 1}, 1, {ease: FlxEase.linear});}});}

//icon bops
function beatHit(){
var targetRotate:Int = curBeat / 2;
if (curBeat % 2 == 0) {
targetRotate *= -1;}
FlxTween.angle(iconP1, targetRotate, 0, 0.3, {ease: FlxEase.quadOut});
FlxTween.angle(iconP2, targetRotate, 0, 0.3, {ease: FlxEase.quadOut});}