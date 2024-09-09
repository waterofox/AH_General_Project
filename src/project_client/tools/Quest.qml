import QtQuick 2.15

Item {

    property bool isActive: true
    property int int_id: 0
    property string text: "none"
    property int pred: -1

    property int forsW: sceneroot.pWidth
    property int forsH: sceneroot.pHeight


    function eventFilter(event)
    {
        if (event.isAutoRepeat){return}
        if (event.key === Qt.Key_E){questManager.is_some_quest(player.scaledX,player.scaledY)}
    }

    onForsHChanged:  {
        questManager.rewrite_quests_position(parent.getScaledX(),parent.getScaledY(),parent.getScaledHeight(),parent.getScaledWidth(),int_id)
    }
    onForsWChanged:  {
        questManager.rewrite_quests_position(parent.getScaledX(),parent.getScaledY(),parent.getScaledHeight(),parent.getScaledWidth(),int_id)
    }

    Component.onCompleted:
    {
        questManager.reg_new_quest(int_id,text,isActive,pred)
        questManager.rewrite_quests_position(parent.getScaledX(),parent.getScaledY(),parent.getScaledHeight(),parent.getScaledWidth(),int_id)
    }
}
