import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
Item {

    property double standartScale: 600.0
    property double standartScaleY: 360.0
    property int actualXCord: 0
    property int actualYCord: 0
    property int actualSize: 10
    property string actualColor: "black"
    property string actualTextur: "None"

    anchors.fill: parent

    property int scaledX: actualXCord*stArea.width/standartScale
    property int scaledY: actualYCord*stArea.height/standartScaleY
    property int scaledWidth: actualSize*stArea.width /standartScale
    property int scaledHeight: actualSize*stArea.height/standartScaleY
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
