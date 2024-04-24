import QtQuick 2.15
import QtQuick.Layouts
Item {

    property double standartScale: 600.0
    property double standartScaleY: 360.0

    property int actualXCord: 0
    property int actualYCord: 0
    property int pWight:  0
    property int pHeight: 0
    property int actualSize: 10
    property string actualColor: "black"
    property string actualTextur: "None"

    property int collisionX: (actualSize/2+actualXCord)*pWight/standartScale
    property int collisionY: (actualSize/2+actualYCord)*pHeight/standartScaleY

    //anchors.fill: parent
    Rectangle
    {
        color:  actualColor
        height: parent.height
        width:  parent.width

        Text {
            color: "white"
            text: "X:" + collisionX + " Y:" + collisionY
        }
    }
}
