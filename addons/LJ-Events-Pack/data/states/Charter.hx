//a

import funkin.backend.chart.EventsData;
function postCreate() {
    var seen:Map<String, Bool> = [];
    var unique = [];

    for (item in EventsData.eventsList) {
        if (seen.exists(item)) continue;
        seen.set(item, true);
        unique.push(item);
    }
    EventsData.eventsList = unique;
}