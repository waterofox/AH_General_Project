import QtQuick 2.15
import QtQuick.Layouts

import "../actors"

Item {
    visible: true
    property int pWidth: 0
    property int pHeight: 0

    //property vector2d<int> collisions: []

    function eventPressedFilter(event)
    {
        actoris.pressed(event);
    }
    function eventReleasedFilter(event)
    {
        actoris.released(event)
    }

    width: pWidth
    height: pHeight

    StaticActor
    {
        id:actorst
        actualSize: 100
        actualXCord: 200
        actualYCord: 200
    }

    ActorController
    {
        id: actoris
    }
}
