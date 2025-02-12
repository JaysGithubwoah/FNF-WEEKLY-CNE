var path1:String = 'bg/hominid/';
var daScale:Float = 1.75;
//bro i'm getting cooked out here

function create(){
//remove characters
remove(dad);
remove(boyfriend);

//better cam zoom then what they chose in the json
defaultCamZoom = 0.62;

//stage sprites
bg = new FlxSprite(0, -300);
bg.loadGraphic(Paths.image(path1 + "sky"));
bg.scrollFactor.set(0.5, 0.5);
bg.scale.set(daScale, daScale);
add(bg);

bg2 = new FlxSprite(100, -350);
bg2.loadGraphic(Paths.image(path1 + "distand_buildings"));
bg2.scale.set(daScale, daScale);
bg2.scrollFactor.set(0.8, 0.8);
add(bg2);

helicopter = new FlxSprite(-725, -100);
helicopter.frames = Paths.getSparrowAtlas(path1 + 'helicopters');
helicopter.animation.addByPrefix('1', 'helicopter_tweak0', 24, true);
helicopter.animation.addByPrefix('2', 'helicopter_funny0', 24, true);
helicopter.animation.addByPrefix('3', 'helicopter_badguy0', 24, true);
//helicopter.animation.play('1');
helicopter.scrollFactor.set(0.85, 0.85);
add(helicopter);
    
bg3 = new FlxSprite(-500, -250);
bg3.loadGraphic(Paths.image(path1 + "side_building_1"));
bg3.scale.set(daScale, daScale);
bg3.scrollFactor.set(0.9, 0.9);
add(bg3);
    
bg4 = new FlxSprite(1500, -250);
bg4.loadGraphic(Paths.image(path1 + "side_building_2"));
bg4.scale.set(daScale, daScale);
bg4.scrollFactor.set(0.9, 0.9);
add(bg4);
    
bg5 = new FlxSprite(50, 700);
bg5.loadGraphic(Paths.image(path1 + "rooftop"));
bg5.scale.set(daScale, daScale);
bg5.scrollFactor.set(1, 1);
add(bg5);

//add characters ontop of all sprites
add(dad);
add(boyfriend);

//character positions
boyfriend.x = 770;
boyfriend.y = 300;
dad.x = 100;
dad.y = 260;
dad.cameraOffset = FlxPoint.weak(155, -80);
boyfriend.cameraOffset = FlxPoint.weak(-125, 0);}

//doing this because they did it in the og stage script. ok???
function postCreate(){FlxG.camera.setPosition(0, 0);}

//random animations for helicopter
var heliAnim = ["1", "2", "3"];
helicameo = FlxG.random.int(0, 2);
function beatHit() {
switch(curBeat){
case 48: //copter flyby | i'd make this a random thing throughout the whole song but i'm lazy
helicopter.animation.play(heliAnim[helicameo], true);
FlxTween.tween(helicopter, {x: 1475}, 5.0, {ease: FlxEase.linear});
}
}