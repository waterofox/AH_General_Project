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


            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: scaledX
            Layout.topMargin: scaledY

            border{
                width: 3
                color: "red"
            }


        }
    }
}

