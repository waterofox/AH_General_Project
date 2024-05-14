import QtQuick 2.15
import QtQuick.Layouts
//import CPP 1.0
Item {
    id: actorRoot
    width: parent.width
    height: parent.height

    property int standartScale:  600
    property int standartScaleY: 360

    property int actualX: 0
    property int actualY: 0
    property int scaledX: actualX*actorRoot.width/  standartScale
    property int scaledY: actualY*actorRoot.height/standartScaleY

    property int actualW: 0
    property int actualH: 0
    property int scaledW: actualW*actorRoot.width/  standartScale
    property int scaledH: actualH*actorRoot.height/standartScaleY

    property int actualSpeed: 0
    property int scaledSpeed: actualSpeed*actorRoot.width/standartScale

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

    onActualSideYChanged:
    {
        if(actualSideY == 0) {actorSprite.source = "qrc:/ani/GameAssets/animations/moveb.gif"; return;}
        if(actualSideY == 1) {actorSprite.source = "qrc:/ani/GameAssets/animations/movef.gif"; return;}
    }

    onScaledXChanged: {
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
    }
    onScaledYChanged: {
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
            if(!collisionRight){
                rightMove = true;  anis = false; disabledCollisionBlock(); actualSideX = 2;return;
            }
        }
        if(event.key === Qt.Key_A){
            if(!collisionLeft){
                leftMove = true;   anis = false; disabledCollisionBlock(); actualSideX = 3; return;
            }
        }
        if(event.key === Qt.Key_W){
            if(!collisionUp){
                upMove = true;   anis = false; disabledCollisionBlock(); actualSideY = 0; return;
            }
        }
        if(event.key === Qt.Key_S){
            if(!collisionDown){
                downMove = true;   anis = false; disabledCollisionBlock();actualSideY = 1; return;
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

            RowLayout
            {
                id: actorSpriteRoot
                anchors.centerIn: parent

                AnimatedImage
                {
                    id: actorSprite
                    source: "qrc:/ani/GameAssets/animations/movef.gif"

                    Layout.minimumHeight: 100*actorArea.height/standartScaleY
                    Layout.minimumWidth: 100*actorArea.width/standartScale

                    Layout.maximumHeight: 100*actorArea.height/standartScaleY
                    Layout.maximumWidth: 100*actorArea.width/standartScale
                    Layout.alignment: Qt.AlignTop

                    Layout.topMargin: -50*actorArea.height/standartScaleY
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

