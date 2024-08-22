import QtQuick 2.15

Rectangle
{
    anchors.fill: parent
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
        player.set(event);
        testQuest.eventFilter(event)
    }
    function eventReleasedFilter(event)
    {
        player.set2(event);
    }
}
