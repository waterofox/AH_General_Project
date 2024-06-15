import QtQuick 2.15
import QtQuick.Layouts
import CTS 1.0
import SSS 1.0
import "../actors"
import "../tools"

Item {
    id:sceneroot
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
    SwitchSectorSystem
    {
        id:switchSystem
    }
    width: parent.width
    height: parent.height

    Flickable
    {
        anchors.fill: parent
        contentWidth: sceneRoot.width
        contentHeight: sceneRoot.height
        contentX:5
        contentY: 5
        Rectangle
        {
            id:sceneRoot
            width: 1800*pWidth/standartScale
            height: 1080*pHeight/standartScaleY
            color: "transparent"

            //place for our actors on game scene
            StaticActor
            {
                id:actor1
                actualSize: 55
                actualXCord: 200
                actualYCord: 200
                actualColor: "yellow"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth

                CollisionRad
                {
                    cppId: 0
                    activeCollision:  true
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
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
            }
            Rectangle
            {
                color:"transparent"
                border
                {
                    color:"green"
                    width:4
                }
                anchors.fill: sceneRoot
            }
        }

    }
    HPbar
    {
        actualHP: player.actualHP
    }
}
