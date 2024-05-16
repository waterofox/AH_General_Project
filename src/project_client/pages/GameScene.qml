import QtQuick 2.15
import QtQuick.Layouts
import CTS 1.0
import "../actors"


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
        cppId: 0
        actualColor: "yellow"
        activeCollision:  false
    }

    StaticActor
    {
        id:actor2
        actualSize: 50
        actualXCord: 200
        actualYCord: 50
        cppId: 1
        actualColor: "blue"
        activeCollision: true
    }

    StaticActor
    {
        id:actor3
        actualSize: 70
        actualXCord: 250
        actualYCord: 50
        cppId: 2
        actualColor: "blue"
        activeCollision: true
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
