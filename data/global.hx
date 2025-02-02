import funkin.backend.utils.NdllUtil;
import funkin.backend.utils.WindowUtils;
import funkin.menus.BetaWarningState;

static var customStates:Map<FlxState, String> = [
    BetaWarningState => 'WeeklyIntro',
    MainMenuState => 'WeeklyMenu',
];

function new(){
    WindowUtils.winTitle = window.title = "FNF Weekly";
}

function preStateSwitch() {
    FlxG.camera.bgColor = 0xff000000;
    for (redirectState in customStates.keys()){
        if(FlxG.game._requestedState is redirectState){
            FlxG.game._requestedState = new ModState(customStates.get(redirectState));
        }
    }
}