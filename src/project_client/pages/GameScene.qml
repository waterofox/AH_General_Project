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
        actualSize: 100
        actualXCord: 200
        actualYCord: 200
        cppId: 0
    }

    StaticActor
    {
        id:actor2
        actualSize: 50
        actualXCord: 50
        actualYCord: 50
        cppId: 1
        actualColor: "blue"
    }

    StaticActor
    {
        id:actor3
        actualSize: 70
        actualXCord: 250
        actualYCord: 50
        cppId: 2
        actualColor: "blue"
    }
    ActorController
    {
        id:player
        actualW: 50
        actualH: 50
        actualX: 100
        actualY: 100
        actualSpeed: 1
    }
}
