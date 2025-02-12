import funkin.backend.scripting.events.StateEvent;
//kino fade in intro
introLength = 0;
function onCountdown(event){
event.cancel();
camHUD.fade(FlxColor.BLACK, 0.01);}
function onSongStart(){
camHUD.fade(FlxColor.BLACK, 7.75, true);}

function beatHit() {
switch(curBeat){
case 112: funnyBars();
case 144: funnyBarsOff();
case 224: camGame.alpha = 0;
case 226: camHUD.alpha = 1; peace();
case 227: quote1();
case 229: quote2();}}

function stepHit(curStep:Int){
switch(curStep){
case 942: bossJumpscare();}
}