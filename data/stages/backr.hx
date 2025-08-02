import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxAxes;

function create() {

}
function postCreate() {
//here cuz inserting backdrops doesnt fucking work for me
remove(boyfriend);
remove(dad);
remove(w);
remove(g);
remove(p);

add(bg = new FlxBackdrop().loadGraphic(Paths.image('bg/spamton/bgscroll')), FlxAxes.Y, 0, 0).antialiasing = Options.antialiasing;
bg.scale.set(0.65,0.65);
bg.y -= 500;
bg.velocity.x -= 1200;
bg.alpha = 0;
// probably doing this wrong
//insert(members.indexOf(gf), bg);

add(bgLegs = new FunkinSprite(boyfriend.x + 75, boyfriend.y + 250)).frames = Paths.getSparrowAtlas('bg/spamton/deltabf_legs');
    bgLegs.animation.addByPrefix('idle', 'fnfwalklegs', 24, true);
    bgLegs.animation.play('idle');
    bgLegs.antialiasing = Options.antialiasing;
    bgLegs.alpha = 0;

    add(w);
    add(p);
    add(boyfriend);
    add(dad);
    add(g);
}
function beatHit(curBeat:Int) {
    switch (curBeat){
        case 168: boyfriend.playAnim('bf steals from homeless man', true, 'LOCK'); FlxG.sound.play(Paths.sound('bepis-yoink'));
        case 180: w.alpha = p.alpha = g.alpha = 0; bg.alpha = bgLegs.alpha = 1;

    }
}