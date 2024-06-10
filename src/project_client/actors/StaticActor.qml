import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
Item {

    width: 1000*forsW/standartScale
    height: 1000*forsH/standartScaleY

    property int forsW: 0
    property int forsH: 0

    property double standartScale: 600.0
    property double standartScaleY: 360.0
    property int actualXCord: 0
    property int actualYCord: 0
    property int actualSize: 10
    property string actualColor: "black"
    property string actualTextur: "None"

    property int scaledX: actualXCord*forsW/standartScale
    property int scaledY: actualYCord*forsH/standartScaleY
    property int scaledWidth: actualSize*forsW /standartScale
    property int scaledHeight: actualSize*forsH/standartScaleY
    RowLayout
    {
        id: stArea
        anchors.fill: parent

        Rectangle
        {
            id: actor
            color:  actualColor

            Layout.maximumHeight: scaledHeight
            Layout.maximumWidth:  scaledWidth

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.topMargin: scaledY
            Layout.leftMargin: scaledX


        }
    }
}
