import QtQuick 2.15
import QtQuick.Layouts
import QtQuick
import QtQuick.Controls
import QtQml
import CTS 1.0
import SSS 1.0
import QuestM 1.0
import "../actors"
import "../tools"
import "game scenes"

Item {
    id:sceneroot
    visible: true
    property int pWidth: 0
    property int pHeight: 0
    property int cameraSlideDuration: 1000
    property bool  st: false

    signal toEventPressedSifon(event: variant)
    signal toEventReleasedSifon(event: variant)

    function eventPressedFilter(event)
    {
        toEventPressedSifon(event)
    }
    function eventReleasedFilter(event)
    {
        toEventReleasedSifon(event)
    }
    function nextUpLevel(){goUp.start();}
    function nextDownLevel(){goDown.start();}
    function nextLeftLevel(){goLeft.start()}
    function nextRightLevel(){goRight.start()}
    Rectangle
    {
        anchors.fill: parent
        //color: "#2E8B57"
        color: '#696969'
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
        onGoUp: nextUpLevel()
        onGoRight: nextRightLevel()
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
            id: engine
            anchors.fill: parent
            property string currentSceneURL: ""
            property var scene: 0

            function set_cuurent_scene(scene_url)
            {
                engine.currentSceneURL = scene_url;
            }

            onCurrentSceneURLChanged:
            {
                if(scene != 0)
                {
                    console.log("hoho")
                    engine.scene.destroy()
                }
                engine.scene = Qt.createComponent(engine.currentSceneURL)
                engine.scene = engine.scene.createObject(sceneRoot)
            }
            Component.onCompleted:
            {
                engine.currentSceneURL = "qrc:/qml/pages/game scenes/SceneOneWinterForest.qml";
            }


            BasickScene
            {
                id:sceneRoot
                visible: true

                Rectangle
                {
                    color:"transparent"
                    border
                    {
                        color:"red"
                        width:4
                    }
                    anchors.fill: sceneRoot
                }
            }
        }
        Button
        {
            x: 0
            y:0
            height: 100
            width: 100
            property int ch: 1
            onClicked: {
                if(ch == 0)
                {
                    engine.set_cuurent_scene("qrc:/qml/pages/game scenes/SceneTwoTestSceneCar.qml")
                    ch = 1
                }
                else
                {
                    engine.set_cuurent_scene("qrc:/qml/pages/game scenes/SceneOneWinterForest.qml")
                    ch = 0
                }
            }
        }
    }
}
