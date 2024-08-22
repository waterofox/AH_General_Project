import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
Item {
    id:actorRoot
    width: sceneRoot.sceneWidth*internal.forsW/standartScale
    height: sceneRoot.sceneHeight*internal.forsH/standartScaleY

    property int actualXCord: 0
    property int actualYCord: 0
    property int actualSize: 10
    property string actualColor: "white"
    property int spriteframeCount: 1

    property string spriteSource: "None"

    function getScaledHeight(){return internal.scaledHeight}
    function getScaledWidth() {return internal.scaledWidth }
    function getScaledX(){return internal.scaledX}
    function getScaledY(){return internal.scaledY}
    QtObject
    {
        id:internal
        property int scaledX: actualXCord*forsW/standartScale
        property int scaledY: actualYCord*forsH/standartScaleY
        property int scaledWidth: actualSize*forsW /standartScale
        property int scaledHeight: actualSize*forsH/standartScaleY

        property int forsW: sceneroot.pWidth
        property int forsH: sceneroot.pHeight
    }
    RowLayout
    {
        id: stArea
        anchors.fill: parent

        Rectangle
        {
            id: actor
            color:  actualColor

            Layout.maximumHeight: internal.scaledHeight
            Layout.maximumWidth:  internal.scaledWidth

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.topMargin: internal.scaledY
            Layout.leftMargin: internal.scaledX

            AnimatedSprite
            {
                id:sprite

                anchors.fill: parent

                source: spriteSource
                smooth: false
                interpolate: false

                frameWidth: 64
                frameHeight: 64

                frameCount: spriteframeCount

                Component.onCompleted: {sprite.start()}
            }
        }
    }
}
