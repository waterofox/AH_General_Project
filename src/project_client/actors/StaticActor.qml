import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
Item {
    id:actorRoot
    width: 1000*forsW/standartScale
    height: 1000*forsH/standartScaleY

    property int forsW: sceneroot.pWidth
    property int forsH: sceneroot.pHeight

    property double standartScale: 600.0
    property double standartScaleY: 360.0
    property int actualXCord: 0
    property int actualYCord: 0
    property int actualSize: 10
    property string actualColor: "white"

    property int scaledX: actualXCord*forsW/standartScale
    property int scaledY: actualYCord*forsH/standartScaleY
    property int scaledWidth: actualSize*forsW /standartScale
    property int scaledHeight: actualSize*forsH/standartScaleY

    property string spriteSource: "None"
    property int spriteSize: 0
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

            RowLayout
            {
                id: actorSpriteRoot
                anchors.centerIn: parent

                Image {
                    id: spite
                    source: spriteSource
                    Layout.minimumHeight: spriteSize*actorRoot.forsH/standartScaleY
                    Layout.minimumWidth: spriteSize*actorRoot.forsW/standartScale

                    Layout.maximumHeight: spriteSize*actorRoot.forsH/standartScaleY
                    Layout.maximumWidth: spriteSize*actorRoot.forsW/standartScale
                    Layout.alignment: Qt.AlignTop


                    Layout.topMargin: (spriteSize/2)*(-1)*actorRoot.forsH/standartScaleY
                }
            }
        }
    }
}
