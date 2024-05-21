import QtQuick 2.15
import QtQuick.Layouts
import CTS 1.0
import "../actors"
import "../tools"

Item {
    visible: true
    property int pWidth: 0
    property int pHeight: 0

    function eventPressedFilter(event)
    {
        player.set(event);
    }
    function eventReleasedFilter(event)
    {
        player.set2(event);

    }
    Rectangle
    {
        anchors.fill: parent
        color: "gray"
    }

    Component.onCompleted: {}
    CollisionTargetSystem
    {
        id:targetSystem
    }

    width: parent.width
    height: parent.height

    StaticActor
    {
        id:actor1
        actualSize: 55
        actualXCord: 200
        actualYCord: 200
        actualColor: "yellow"
        CollisionRad
        {
            cppId: 0
            activeCollision:  false
        }
    }


    ActorController
    {
        id:player
        actualW: 30
        actualH: 50
        actualX: 100
        actualY: 100
        actualSpeed: 1
        moveDownSprite: "qrc:/ani/GameAssets/animations/movef.gif"
        moveUpSprite: "qrc:/ani/GameAssets/animations/moveb.gif"
    }
}
