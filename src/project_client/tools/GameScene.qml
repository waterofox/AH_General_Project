import QtQuick 2.15
import CTS
import QuestM
Rectangle
{

    anchors.fill: parent
    property bool isActiveScene:true
    focus: true
    Connections
    {
        target: sceneroot
        onToEventPressedSifon: eventPressedFilter(event)
        onToEventReleasedSifon: eventReleasedFilter(event)
    }
    Connections
    {
        target: questManager
        onShowQuest: {
            player.set_mess(text)
            player.visDialogWindiw = true
        }
        onEndQuest:{
            player.visDialogWindiw = false
            player.set_mess("")
        }
    }
    function eventPressedFilter(event)
    {
        if(!isActiveScene){return}
        player.set(event);
        testQuest.eventFilter(event)
    }
    function eventReleasedFilter(event)
    {
        if(!isActiveScene){return}
        player.set2(event);
    }
}
