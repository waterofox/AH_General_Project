import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
Item {

    property double standartScale: 600.0
    property double standartScaleY: 360.0

    property int cppId: 0
    property int actualXCord: 0
    property int actualYCord: 0
    property int actualSize: 10
    property string actualColor: "black"
    property string actualTextur: "None"

    property int collisionX: (actualSize/2+actualXCord)*parent.width/standartScale
    property int collisionY: (actualSize/2+actualYCord)*parent.height/standartScaleY

    property bool activeCollision: false

    signal newCollision(int x, int y)

    Component.onCompleted: {
        if(!activeCollision){return}
        targetSystem.add_to_target(collisionX,collisionY,actor.width/2,cppId)
    }
    onCollisionXChanged: {if(!activeCollision){return};targetSystem.reRender_coords(collisionX,collisionY,actor.width/2,cppId)}
    onCollisionYChanged: {if(!activeCollision){return};targetSystem.reRender_coords(collisionX,collisionY,actor.width/2,cppId)}

    anchors.fill: parent
    RowLayout
    {
        id: stArea
        anchors.fill: parent

        Rectangle
        {
            id: actor
            color:  actualColor

            Layout.maximumHeight: actualSize*stArea.height/standartScaleY
            Layout.maximumWidth:  actualSize*stArea.width /standartScale

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.topMargin: actualYCord*stArea.height/standartScaleY
            Layout.leftMargin: actualXCord*stArea.width/standartScale


        }
    }
}
