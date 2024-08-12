import QtQuick 2.15
import QtQuick.Layouts
import CTS 1.0
import SSS 1.0
import QuestM 1.0
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
        testQuest.eventFilter(event)

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
        //color: "#2E8B57"
        color: '#696969'
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
    QuestManger
    {
        id:questManager
    }
    Connections
    {
        target: questManager
        onShowQuest: {
            player.set_mess(text)
            player.visDialogWindiw = true
        }
        onEndQuest:{
            player.visDialogWindiw = false
            player.set_mess("")
        }
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
            id:sceneRoot
            width: 1800*pWidth/standartScale
            height: 1080*pHeight/standartScaleY
            color: "transparent"


            //place for our actors on game scene
            /*
              Сюда следует размещать актёров и квесты для создания рабочей игровой сцены.

              Каждый АКТЁР представляет из себя отдельный новый слой. Учитывайте это, когда будете продумывать порядок добавления их на игровую сцену

              Каждый КВЕСТ создаётся в последовательности, которая тянется снизу ввурх. (Т.е вверх по коду).
            */

            QuestArea
            {
               id:treeQuest
                aX: 300
                aY: 400
                aSize: 200
                text: "А это просто дерево :3/Оно демонстрирует работу\nквестов!/"
                pred: 0
                int_id: 1
                aColor: "#7dc4fa"
                aSpriteSize: 350
                aSpriteSource: "qrc:/res/GameAssets/statickAssets/holetree.png"
            }
            QuestArea
            {
               id:testQuest
                aX: 30
                aY: 100
                aSize: 100
                text: "Добро пожаловать в AH GENERAL\nPROJECT!/Этот проект посвящён\nразработке видео игры!/Суть в том, что игра пишется \nбез помощи игрового движка./Автор очень нуждается в вашей \nподдержке!/Можно переводом на Сбер или\nТинькофф:\n +7тут мог быть мой номер/"
                pred: -1
                int_id: 0
                aColor: "#7dc4fa"
                aSpriteSize: 100
                aSpriteSource: "qrc:/res/GameAssets/statickAssets/ah.png"
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

            }
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
}
