import QtQuick 2.15
import "../actors"
Item {
    property bool isActive: true
    property bool glowborder: true
    property int qX: 0
    property int qY: 0
    property int qSize: 0
    property int forsH: 0
    property int forsW: 0
    StaticActor
    {
        id: area
        actualSize: qSize
        actualXCord: qX
        actualYCord: qY
        actualColor: "transparent"
        forsH:forsH
        forsW: forsW
    }
    Rectangle
    {
        id:areaBorder
        anchors.fill: area
        color:"transparent"
        visible: glowborder
        border{
            color: "yellow"
            width: 3
        }
    }
}
