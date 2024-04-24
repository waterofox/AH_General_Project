import QtQuick 2.15
import QtQuick.Layouts
import CPP 1.0
Item {

    property int pWidth :0
    property int pHeight:0
    property double standartScale: 600.0
    property double standartScaleY: 360.0

    function pressed(event)
    {
        actorRoot.chekPressd(event)
    }
    function released(event)
    {
        actorRoot.chekReleased(event)
    }
    width:  pWidth
    height: pHeight
    GridView
    {
        id:actorRoot
        anchors.fill: parent

        model: ActorModel{}

        property double xRelative: 0
        property double yRelative: 0

        cellHeight: parent.height
        cellWidth: parent.width

        property int xScaled : xRelative*actorRoot.width/standartScale
        property int yScaled : yRelative*actorRoot.height/standartScaleY

        property bool moveYFlag: false
        property bool moveXFlag: false

        property int collisionX: xScaled+actorMinW/2
        property int collisionY: yScaled+actorMinH/2

        property int flip: 1

        flickableDirection: Flickable.AutoFlickIfNeeded

        property int actorMinW: actorRoot.width/11
        property int actorMinH: actorRoot.height/8

        function chekPressd(event)
        {
            if(event.key === Qt.Key_W)
            {
                actorRoot.model.setRelativePositon(3);
                moveYFlag = true
            }
            if(event.key === Qt.Key_S)
            {
                actorRoot.model.setRelativePositon(4);
                moveYFlag = true
            }
            if(event.key === Qt.Key_D)
            {
                actorRoot.model.setRelativePositon(1);
                actorRoot.flip = 1
                moveXFlag = true
            }
            if(event.key === Qt.Key_A)
            {
                actorRoot.model.setRelativePositon(2);
                actorRoot.flip = -1
                moveXFlag = true
            }
        }
        function chekReleased(event)
        {
            if(event.key === Qt.Key_W){moveYFlag = false;actorRoot.model.updateRelativePosition(actorRoot.xRelative,actorRoot.yRelative) }
            if(event.key === Qt.Key_S){moveYFlag = false;actorRoot.model.updateRelativePosition(actorRoot.xRelative,actorRoot.yRelative) }
            if(event.key === Qt.Key_D){moveXFlag = false;actorRoot.model.updateRelativePosition(actorRoot.xRelative,actorRoot.yRelative) }
            if(event.key === Qt.Key_A){moveXFlag = false;actorRoot.model.updateRelativePosition(actorRoot.xRelative,actorRoot.yRelative) }
        }

        delegate:
        RowLayout
        {
            id:actorArea

            width: actorRoot.width
            height: actorRoot.height
            Component.onCompleted:
            {
                regNewPosition();
            }
            function regNewPosition()
            {
                actorRoot.xRelative = actor_x
                actorRoot.yRelative = actor_y
            }
            Rectangle
            {
                id:actor

                Layout.minimumWidth: actorRoot.actorMinW
                Layout.minimumHeight: actorRoot.actorMinH

                Layout.alignment: Qt.AlignTop

                Layout.leftMargin:  actorRoot.xScaled
                Layout.topMargin: actorRoot.yScaled

                color: "transparent"

                border{
                    color:"red"
                    width: 3
                }

                Image {
                    id: actorSprite
                    property int flip: 1
                    source: actor_frame

                    sourceSize.width: actor.width*actor_;
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit

                    transform: Scale {origin.x: 28*actorArea.width/standartScale; xScale: actorRoot.flip}

                }
                Text {
                    id: actorCords
                    color: "black"
                    text: "X: " + actorRoot.collisionX + " Y: " + actorRoot.collisionY
                }
            }
            SequentialAnimation
            {
                id:movement
                NumberAnimation {
                    target: actorRoot
                    property: "yRelative"
                    from: actorRoot.yRelative
                    to: actor_y;
                    duration: 1000
                }
                loops: Animation.Infinite
                running: actorRoot.moveYFlag
            }
            SequentialAnimation
            {
                id:movement2
                NumberAnimation {
                    target: actorRoot
                    property: "xRelative"
                    from: actorRoot.xRelative
                    to: actor_x;
                    duration: 1000
                }
                loops: Animation.Infinite
                running: actorRoot.moveXFlag
            }
        }
    }

}
