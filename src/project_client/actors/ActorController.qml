import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import "../tools"
//import CPP 1.0
Item {
    id: actorRoot
    width: parent.width
    height: parent.height

    property int forsW: sceneroot.pWidth
    property int forsH: sceneroot.pHeight

    property int standartScale:  600
    property int standartScaleY: 360

    property int actualX: 0
    property int actualY: 0
    property int scaledX: actualX*actorRoot.forsW/  standartScale
    property int scaledY: actualY*actorRoot.forsH/standartScaleY

    property int actualW: 0
    property int actualH: 0
    property int scaledW: actualW*actorRoot.forsW/  standartScale
    property int scaledH: actualH*actorRoot.forsH/standartScaleY

    property double actualSpeed: 0
    property double scaledSpeed: actualSpeed//*actorRoot.forsW/standartScale

    property bool nstart: false

    property bool rightMove: false
    property bool leftMove:  false
    property bool upMove:    false
    property bool downMove:  false

    property bool collisionRight: false
    property bool collisionLeft: false
    property bool collisionUp: false
    property bool collisionDown: false

    property int actualSideX: 2
    property int actualSideY: 3


    property bool anis: true

    property string moveUpSprite: "none"
    property string moveDownSprite: "none"
    property string moveLNRSprite: "none"
    property int spriteSize: 100

    property int actualHP: 5

    property int xch: actor.x
    property int ych: actor.y

    property bool visDialogWindiw: false
    function setHP(newArg)
    {
        actualHP = newArg
    }

    onActualSideYChanged:
    {
        if(actualSideY == 0) {actorSprite.source = moveUpSprite; return;}
        if(actualSideY == 1) {actorSprite.source = moveDownSprite; return;}
    }

    function set_mess(arg)
    {
        dialogWindow.actualText = arg
    }

    function ch_collisionX()
    {
        targetSystem.update_actor_cordX(scaledX+scaledW)
        targetSystem.update_actor_cordY(scaledY+scaledH)
        if(targetSystem.is_collision())
        {
            collisionRight = true
            rightMove = false
            return;
        }
        targetSystem.update_actor_cordX(scaledX+scaledW)
        targetSystem.update_actor_cordY(scaledY+scaledH/2)
        if(targetSystem.is_collision())
        {
            collisionRight = true
            rightMove = false
            return;
        }
        targetSystem.update_actor_cordX(scaledX+scaledW)
        targetSystem.update_actor_cordY(scaledY)
        if(targetSystem.is_collision())
        {
            collisionRight = true
            rightMove = false
            return;
        }
        targetSystem.update_actor_cordX(scaledX)
        targetSystem.update_actor_cordY(scaledY+scaledH)
        if(targetSystem.is_collision())
        {
            collisionLeft = true
            leftMove = false
            return;
        }
        targetSystem.update_actor_cordX(scaledX)
        targetSystem.update_actor_cordY(scaledY+scaledH/2)
        if(targetSystem.is_collision())
        {
            collisionLeft = true
            leftMove = false
            return;
        }
        targetSystem.update_actor_cordX(scaledX)
        targetSystem.update_actor_cordY(scaledY)
        if(targetSystem.is_collision())
        {
            collisionLeft = true
            leftMove = false
            return;
        }
        disabledCollisionBlock()
    }
    function ch_collisionY()
    {
        targetSystem.update_actor_cordY(scaledY)
        targetSystem.update_actor_cordX(scaledX+scaledW/2)
        if(targetSystem.is_collision())
        {
            collisionUp = true
            upMove = false
            return;
        }
        targetSystem.update_actor_cordY(scaledY)
        targetSystem.update_actor_cordX(scaledX+scaledW)
        if(targetSystem.is_collision())
        {
            collisionUp = true
            upMove = false
            return;
        }
        targetSystem.update_actor_cordY(scaledY)
        targetSystem.update_actor_cordX(scaledX)
        if(targetSystem.is_collision())
        {
            collisionUp = true
            upMove = false
            return;
        }
        targetSystem.update_actor_cordY(scaledY+scaledH)
        targetSystem.update_actor_cordX(scaledX+scaledW/2)
        if(targetSystem.is_collision())
        {
            collisionDown = true
            downMove = false
            return;
        }
        targetSystem.update_actor_cordY(scaledY+scaledH)
        targetSystem.update_actor_cordX(scaledX)
        if(targetSystem.is_collision())
        {
            collisionDown = true
            downMove = false
            return;
        }
        targetSystem.update_actor_cordY(scaledY+scaledH)
        targetSystem.update_actor_cordX(scaledX+scaledW)
        if(targetSystem.is_collision())
        {
            collisionDown = true
            downMove = false
            return;
        }
        disabledCollisionBlock()
    }
    onScaledXChanged: {
        ch_collisionX();
        switchSystem.update_player_cords(scaledX,scaledY)
        switchSystem.check_level()
    }
    onScaledYChanged: {
        ch_collisionY();
        switchSystem.update_player_cords(scaledX,scaledY)
        switchSystem.check_level()
    }
    Component.onCompleted: {
        disabledCollisionBlock()
    }
    function disabledCollisionBlock()
    {
        collisionDown = false
        collisionRight = false
        collisionUp = false
        collisionLeft = false
    }
    function set(event)
    {
        if (event.isAutoRepeat){return}
        if(event.key === Qt.Key_D){
            if(!collisionRight || !targetSystem.is_collision()){
                rightMove = true;  anis = false; actualSideX = 2;return;
            }
        }
        if(event.key === Qt.Key_A){
            if(!collisionLeft || !targetSystem.is_collision()){
                leftMove = true;   anis = false; actualSideX = 3; return;
            }
        }
        if(event.key === Qt.Key_W){
            if(!collisionUp || !targetSystem.is_collision()){
                upMove = true;   anis = false; actualSideY = 0; return;
            }
        }
        if(event.key === Qt.Key_S){
            if(!collisionDown || !targetSystem.is_collision()){
                downMove = true;   anis = false; actualSideY = 1; return;
            }
        }
    }
    function set2(event)
    {
        if (event.isAutoRepeat){return}
        if(event.key === Qt.Key_D){
            rightMove = false
        }
        if(event.key === Qt.Key_A){
            leftMove = false
        }
        if(event.key === Qt.Key_W){
            upMove = false
        }
        if(event.key === Qt.Key_S){
            downMove = false
        }
        if(!rightMove && !leftMove && !upMove && !downMove) {anis = true}
    }
    SequentialAnimation
    {
        id:toRight
        PropertyAnimation {
            target: actorRoot
            property: "actualX"
            duration: 1
            from: actualX
            to: actualX+1*scaledSpeed
        }
        loops: Animation.Infinite
        running: rightMove
    }
    SequentialAnimation
    {
        id:toLeft
        PropertyAnimation {
            target: actorRoot
            property: "actualX"
            duration: 1
            from: actualX
            to: actualX-1*scaledSpeed
        }
        loops: Animation.Infinite
        running: leftMove
    }
    SequentialAnimation
    {
        id:toUp
        PropertyAnimation {
            target: actorRoot
            property: "actualY"
            duration: 1
            from: actualY
            to: actualY-1*scaledSpeed
        }
        loops: Animation.Infinite
        running: upMove
    }
    SequentialAnimation
    {
        id:toDown
        PropertyAnimation {
            target: actorRoot
            property: "actualY"
            duration: 1
            from: actualY
            to: actualY+1*scaledSpeed
        }
        loops: Animation.Infinite
        running: downMove
    }
    RowLayout
    {
        id:actorArea
     anchors.fill: parent

        Rectangle
        {
            id:actor

            Layout.fillHeight: true
            Layout.fillWidth:  true
            Layout.maximumWidth: scaledW
            Layout.maximumHeight: scaledH

            GameLabel
            {
                id:dialogWindow
                visible: visDialogWindiw
                width: 200*actorRoot.forsW/standartScale
                height: 60*actorRoot.forsH/standartScaleY
                x:50*actorRoot.forsW/standartScale
                y:-50*actorRoot.forsH/standartScaleY
            }
            RowLayout
            {
                id: actorSpriteRoot
                anchors.centerIn: parent



                AnimatedImage
                {
                    id: actorSprite
                    //for idle sprite
                    source: "qrc:/ani/GameAssets/animations/movef.gif"

                    Layout.minimumHeight: spriteSize*actorRoot.forsH/standartScaleY
                    Layout.minimumWidth: spriteSize*actorRoot.forsW/standartScale

                    Layout.maximumHeight: spriteSize*actorRoot.forsH/standartScaleY
                    Layout.maximumWidth: spriteSize*actorRoot.forsW/standartScale
                    Layout.alignment: Qt.AlignTop

                    Layout.topMargin: -(spriteSize/2)*actorRoot.forsH/standartScaleY
                    paused: anis
                    onPausedChanged: actorSprite.currentFrame = 2
                }
            }

            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: scaledX
            Layout.topMargin: scaledY

            border{
                width: 3
                color: "red"
            }
            color: "transparent"
        }
    }
}

