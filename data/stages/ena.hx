//most cne friendly code so far.. thanks weekly devs
var path1:String = "bg/";
function create(){
    //yadda yadda remove characters
    remove(dad);
    remove(boyfriend);

    var sky:FlxSprite = new FlxSprite(-685, -506);
    sky.loadGraphic(Paths.image(path1 + "ena/sky"));
    sky.antialiasing = true;
    sky.scrollFactor.set(0.65, 0.65);
	add(sky);
    
    var clouds:FlxSprite = new FlxSprite(-712, -513);
    clouds.loadGraphic(Paths.image(path1 + "ena/clouds"));
    clouds.antialiasing = true;
    clouds.scrollFactor.set(0.75, 0.75);
	add(clouds);
    
    var statues:FlxSprite = new FlxSprite(289, -14);
    statues.loadGraphic(Paths.image(path1 + "ena/far_places"));
    statues.antialiasing = true;
    statues.scrollFactor.set(0.8, 0.8);
	add(statues);
    
    var hillsback:FlxSprite = new FlxSprite(-747, 267);
    hillsback.loadGraphic(Paths.image(path1 + "ena/more_hills"));
    hillsback.antialiasing = true;
    hillsback.scrollFactor.set(0.85, 0.85);
	add(hillsback);

    var hills:FlxSprite = new FlxSprite(-667, 236);
    hills.loadGraphic(Paths.image(path1 + "ena/hills_back"));
    hills.antialiasing = true;
    hills.scrollFactor.set(0.9, 0.9);
	add(hills);
    
    var hourglass:FlxSprite = new FlxSprite(-420, 117);
    hourglass.loadGraphic(Paths.image(path1 + "ena/hourglasses_bg"));
    hourglass.antialiasing = true;
    hourglass.scrollFactor.set(0.95, 0.95);
	add(hourglass);

    var floor:FlxSprite = new FlxSprite(-756, 521);
    floor.loadGraphic(Paths.image(path1 + "ena/hill_floor"));
    floor.antialiasing = true;
	add(floor);

    //i feel stupid commiting it like this but im so lazy dude
    add(dad);
    add(boyfriend);
    //and their positions
    boyfriend.x = 1000;
    boyfriend.y = 185;
    dad.x = -50;
    dad.y = 0;
    //camera position from weekly json (let me know if there is a better way for this i'm a bit stupid okay)
    dad.cameraOffset = FlxPoint.weak(150, -140);
    boyfriend.cameraOffset = FlxPoint.weak(-200, -75);
}