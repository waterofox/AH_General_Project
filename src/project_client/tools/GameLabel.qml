import QtQuick 2.15
import QtQuick.Layouts
Item {

    id: root
    width: 100
    height:100
    property string sourceIcon: "qrc:/ani/GameAssets/animations/ahdialog.gif"
    property string actualText: "but nobody cames... \nно никто не пришёл \nно никто не пришёл"
    property bool pauseIcon:true
    function set_icon(arg){}
    Rectangle
    {
        anchors.fill: parent
        color: "black"
        Rectangle
        {
            anchors.centerIn: parent
            color: "black"
            width: parent.width-(3*root.width/100)
            height: parent.height-(3*root.width/100)
            border
            {
                color:"white"
                width:1*root.width/100
            }
            RowLayout
            {
                id:labelArea
                anchors.fill: parent
                Rectangle
                {
                    id: iconRoot
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.maximumHeight: labelArea.height-(20*root.height/100)
                    Layout.maximumWidth: labelArea.height-(20*root.height/100)
                    Layout.leftMargin: 10*root.height/100
                    color:"green"
                    AnimatedImage
                    {
                        id: icon
                        anchors.centerIn: parent
                        source: sourceIcon
                        anchors.fill: parent

                        paused: pauseIcon
                        onPausedChanged: icon.currentFrame = 1
                    }
                }
                Rectangle
                {
                    id:textArea
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: "transparent"
                    FontLoader{id:pixFont; source:"qrc:/fon/GameAssets/fonts/EpilepsySans.ttf"}
                    Text {
                        id: someText

                        property int index
                        property string sourceTex: actualText
                        property  int sourceLenght: 0

                        font.family: pixFont.font.family
                        //font.family: pixFont.font
                        font.pixelSize: 60*root.height/standartScaleY

                        anchors.left: parent.left
                        anchors.leftMargin: 10*root.width/standartScale
                        anchors.top:parent.top
                        anchors.topMargin: 50*root.height/standartScaleY

                        text: actualText.slice(0,++index)
                        color:"white"
                        onSourceTexChanged: {
                            index = 0
                            sourceLenght = sourceTex.length
                            textAnimation.start()
                            pauseIcon = false
                        }
                        NumberAnimation on index {
                            id:textAnimation
                            to: someText.sourceLenght
                            duration: 1800

                            onStopped: pauseIcon = true
                        }
                    }

                }
            }
        }
    }
}
