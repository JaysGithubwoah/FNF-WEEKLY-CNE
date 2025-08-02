import flixel.addons.display.FlxBackdrop;

var walkDown:Bool = false;

function create(){
camHUD.visible = false;

//juuust in case
camZooming = true;
//camera for da barz
cinemaCam = new FlxCamera(0, 0);
cinemaCam.bgColor = FlxColor.TRANSPARENT;

FlxG.cameras.remove(camHUD, false);
FlxG.cameras.add(cinemaCam, false);
FlxG.cameras.add(camHUD, false);

defaultCamZoom = 0.7;

//lazy
remove(dad);
remove(boyfriend);

add(bg = new FlxBackdrop().loadGraphic(Paths.image('bg/bocchibg'), FlxAxes.Y, 0, 0)).antialiasing = Options.antialiasing;
bg.y -= 280;
bg.velocity.x = 75;

add(dad);
add(boyfriend);

boyfriend.x += 150;
boyfriend.cameraOffset.x -= 250;
boyfriend.y = -0;
dad.y = 0;
}

function postCreate(){
    camera.followLerp = 0.09;

    barTop = new FlxSprite().makeGraphic(Std.int(FlxG.width * 1), Std.int(68), FlxColor.BLACK);
    barTop.screenCenter(FlxAxes.X);
    barTop.cameras = [cinemaCam];
    barBottom = new FlxSprite().makeGraphic(Std.int(FlxG.width * 1), Std.int(68), FlxColor.BLACK);
    barBottom.screenCenter(FlxAxes.X);
    barBottom.cameras = [cinemaCam];
    barBottom.y = 652;
    add(barTop);
    add(barBottom);
}


function beatHit()
{
    if (curBeat % 2 == 0) 
    {
        walkDown = !walkDown;
        
        if(walkDown)
        {
            boyfriend.y = 50;
            dad.y = 50;
        }
        else
        {
            boyfriend.y = -0;
            dad.y = 0;
        }
    }
    switch (curBeat){
        case 30: camHUD.visible = true;
        case 164, 172, 180, 392, 400, 408: defaultCamZoom = 0.8;
        case 168, 176, 192, 396, 404, 420: defaultCamZoom = 0.7;
        case 484: camHUD.visible = false;
        case 514: camGame.visible = false;
    }
}