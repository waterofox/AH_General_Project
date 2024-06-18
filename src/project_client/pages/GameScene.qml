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
    property int cameraSlideDuration: 2000
    property bool  st: false

    function eventPressedFilter(event)
    {
        player.set(event);
    }
    function eventReleasedFilter(event)
    {
        player.set2(event);
    }
    function nextUpLevel(){goUp.start();}
    function nextDownLevel(){goDown.start();}
    function nextLeftLevel(){goLeft.start()}
    function nextRightLevel(){goRight.start()}
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
        Component.onCompleted: {st = true;switchSystem.update_level_size(camera.height,camera.width)}
    }
    Connections
    {
        target: switchSystem
        onGoDown: nextDownLevel()
    }
    Connections
    {
        target: switchSystem
        onGoUp: nextUpLevel()
    }
    Connections
    {
        target: switchSystem
        onGoRight: nextRightLevel()
    }
    Connections
    {
        target: switchSystem
        onGoLeft: nextLeftLevel()
    }
    width: parent.width
    height: parent.height
    Flickable
    {
        property int actualconX: 0
        property int actualconY: 0
        id:camera
        anchors.fill: parent
        contentWidth: sceneRoot.width
        contentHeight: sceneRoot.height

        contentX: actualconX*camera.width/standartScale
        contentY: actualconY*camera.height/standartScaleY

        clip: true
        interactive: false

        onWidthChanged: {

            if(!st){return}
            switchSystem.update_level_size(camera.height,camera.width);}
        onHeightChanged: {
            if(!st){return}
            switchSystem.update_level_size(camera.height,camera.width)}

        PropertyAnimation
        {
            id: goDown
            target: camera
            property: "actualconY"
            from: camera.actualconY
            to:camera.actualconY +standartScaleY
            duration: cameraSlideDuration
            running: false
        }
        PropertyAnimation
        {
            id: goUp
            target: camera
            property: "actualconY"
            from: camera.actualconY
            to:camera.actualconY -standartScaleY
            duration: cameraSlideDuration
            running: false
        }
        PropertyAnimation
        {
            id: goRight
            target: camera
            property: "actualconX"
            from: camera.actualconX
            to:camera.actualconX +standartScale
            duration: cameraSlideDuration
            running: false
        }
        PropertyAnimation
        {
            id: goLeft
            target: camera
            property: "actualconX"
            from: camera.actualconX
            to:camera.actualconX - standartScale
            duration: cameraSlideDuration
            running: false
        }



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

                onActualYChanged: {console.log(player.ych)}

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
