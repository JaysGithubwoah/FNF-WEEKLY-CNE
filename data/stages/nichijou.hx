var iconMio:HealthIcon;

function create() {gradient.blend = 12;}

function postCreate() {
	iconMio = new HealthIcon(strumLines.members[2].characters[0].getIcon());
    iconMio.camera = camHUD;
    insert(members.indexOf(iconP2) + 1,iconMio);

    iconMai = new HealthIcon(strumLines.members[3].characters[0].getIcon());
    iconMai.camera = camHUD;
    insert(members.indexOf(iconP2),iconMai);

}

function postUpdate(elapsed:Float){
	iconMio.scale.set(lerp(iconMio.scale.x,1,0.1), lerp(iconMio.scale.y,1,0.1));
    iconMio.x = iconP2.x - 75;
    iconMio.health = iconP2.health;
    iconMio.y = iconP2.y + 25;
	iconMio.alpha = iconP2.alpha;

	iconMai.scale.set(lerp(iconMio.scale.x,1,0.1), lerp(iconMio.scale.y,1,0.1));
    iconMai.x = iconP2.x - 75;
    iconMai.health = iconP2.health;
    iconMai.y = iconP2.y - 25;
	iconMai.alpha = iconP2.alpha;

}

function beatHit(curBeat:Int) {iconMio.scale.set(1.2,1.2); iconMai.scale.set(1.2,1.2);}
