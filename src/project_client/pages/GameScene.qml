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
        actoris.pressed(event);
    }
    function eventReleasedFilter(event)
    {
        actoris.released(event)
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
        id:actorst
        actualSize: 100
        actualXCord: 200
        actualYCord: 200
        cppId: 0
    }
    ActorController
    {
        id:player
        actualW: 50
        actualH: 50
        actualX: 100
        actualY: 100
    }
}
