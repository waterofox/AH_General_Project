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
        color: "#2E8B57"
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
                actualSize: 55
                actualXCord: 250
                actualYCord: 200
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/tree.png"
                spriteSize: 200
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 400
                actualYCord: 205
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/tree.png"
                spriteSize: 220
            }
            ActorController
            {
                id:player
                actualW: 30
                actualH: 50
                actualX: 150
                actualY: 220
                actualSpeed: 1
                moveDownSprite: "qrc:/ani/GameAssets/animations/movef.gif"
                moveUpSprite: "qrc:/ani/GameAssets/animations/moveb.gif"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth

                onActualYChanged: {console.log(player.ych)}

            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 25
                actualYCord: 25
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/doubletree.png"
                spriteSize: 200
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 120
                actualYCord: 40
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/doubletree.png"
                spriteSize: 200
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 200
                actualYCord: 40
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/xmastreeSAD.png"
                spriteSize: 220
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 200
                actualYCord: 200
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/holetree.png"
                spriteSize: 250
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 70
                actualYCord: 190
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/tree.png"
                spriteSize: 250
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 25
                actualYCord: 250
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/doubletree.png"
                spriteSize: 200
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 25
                actualYCord: 250
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/xmastreeSAD.png"
                spriteSize: 220
            }
            StaticActor
            {
                actualSize: 55
                actualXCord: 30
                actualYCord: 350
                actualColor: "transparent"
                forsH:sceneroot.pHeight
                forsW: sceneroot.pWidth
                spriteSource: "qrc:/res/GameAssets/statickAssets/tree.png"
                spriteSize: 250
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
