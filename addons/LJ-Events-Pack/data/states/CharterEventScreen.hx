//a

/*
    
    DISABLE THIS IF EDITING EVENTS CAUSES ISSUES IN CHARTER!!!!!

*/

import funkin.editors.ui.UIScrollBar;

var paramCamera:FlxCamera = new FlxCamera();
var __releaseMe:FlxCamera = new FlxCamera();
__releaseMe.bgColor = paramCamera.bgColor = 0;

var creatingEvent:Bool = true;

var scrollingBar:UIScrollBar;
function postCreate() {

    FlxG.cameras.add(paramCamera, false);
    FlxG.cameras.add(__releaseMe, false);
    paramsPanel.camera = eventName.camera = paramCamera;

    __releaseMe.width = paramCamera.width = winWidth - 75;
    __releaseMe.height = paramCamera.height = winHeight - 30;

    scrollingBar = new UIScrollBar(0, 0, 1000, 0, 50);
    scrollingBar.camera = __releaseMe;
    scrollingBar.x = scrollingBar.camera.width - scrollingBar.width;
    scrollingBar.onChange = (v) -> addY = v;
    add(scrollingBar);
}

var prev_curEvent:Int = curEvent;
function update(elapsed) {
    if (prev_curEvent != curEvent) addY = _min;
    __releaseMe.alpha = paramCamera.alpha = subCam.alpha;
    __releaseMe.zoom = paramCamera.zoom = subCam.zoom;

    prev_curEvent = curEvent;
}

var addY:Float = 0;
var _min = 30;

var delayFrame:Bool = true;
function postUpdate(elapsed) {
    if (delayFrame) {
        delayFrame = false;
        
        paramCamera.x = __releaseMe.x = -subCam.scroll.x - (-59) + 15;
        paramCamera.y = __releaseMe.y = -subCam.scroll.y + 30;
    }

    if (FlxG.mouse.wheel != 0) addY -= FlxG.mouse.wheel*32;

    paramCamera.scroll.x = (subCam.scroll.x + (winWidth*0.5) - (winWidth*0.25)) - 15;

    var filteredItems = paramsPanel.members.copy();
    filteredItems = filteredItems.filter(item -> item != null);
    
    scrollingBar.start = addY - (scrollingBar.size * 0.5) - _min;

    if (filteredItems.length < 1) return;
    var _max = (filteredItems[filteredItems.length-1].y - paramCamera.height) + 35;
    if (_max < 0) _max = _min;

    scrollingBar.length = __releaseMe.height;

    paramCamera.scroll.y = addY = FlxMath.bound(addY, _min, _max);
}

function destroy() {
    FlxG.cameras.remove(paramCamera, true);
    FlxG.cameras.remove(__releaseMe, true);
}