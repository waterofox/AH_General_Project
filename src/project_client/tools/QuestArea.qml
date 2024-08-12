import QtQuick 2.15
import "../actors"
Item {
    visible: true
    id: root
    anchors.fill: parent
    property bool isActive: true
    property int int_id: 0
    property string text: "none"
    property int pred: -1

    property int aSize: 0
    property int aX: 0
    property int aY: 0

    property string aColor: "transparent"

    property string actualColor: "white"

    property string aSpriteSource: "None"
    property int aSpriteSize: 0

    //todo нужно добавить в хранилище квестов путь для иконки диалога

    StaticActor
    {
        id:area
        actualSize: aSize
        actualXCord: aX
        actualYCord: aY
        actualColor: aColor
        forsH:sceneroot.pHeight
        forsW: sceneroot.pWidth
        spriteSize: aSpriteSize
        spriteSource: aSpriteSource
    }

    function eventFilter(event)
    {
        if (event.isAutoRepeat){return}
        if (event.key === Qt.Key_E){questManager.is_some_quest(player.actualX,player.actualY)}
    }

    Component.onCompleted:
    {
        questManager.reg_new_quest(int_id,text,isActive,pred);
        questManager.rewrite_quests_position(area.scaledX,area.scaledY,area.scaledHeight,area.scaledWidth,int_id);
    }

}
