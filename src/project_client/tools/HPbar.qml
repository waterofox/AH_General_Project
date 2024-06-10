import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
Item {
    property int actualHP: value
    anchors.fill: parent
    RowLayout
    {
        id: interFace
        anchors.fill: parent
        RowLayout
        {
            id:hp_fra
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 35*parent.height/standartScaleY
            Layout.alignment: Qt.AlignTop

            Layout.topMargin: 10*parent.height/standartScaleY
            Layout.leftMargin: 10*parent.width/standartScale

            Rectangle
            {
                id:fractionIco

                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumWidth: 35 *interFace.width/standartScale
                Layout.alignment: Qt.AlignLeft

                border
                {
                    color: "white"
                    width: 2 *interFace.width/standartScale
                }

                color:"transparent"
            }
            ColumnLayout
            {
                id: hpArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.maximumWidth: 180 *interFace.width/standartScale
                Layout.alignment: Qt.AlignLeft

                ProgressBar
                {
                    id:hpBar

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    from: 0
                    to: 10
                    value: actualHP
                }
                Text {
                    id: hp

                    Layout.alignment: Qt.AlignLeft

                    text:"HP: " +  actualHP
                    color:"white"
                    font.pixelSize: 12*interFace.width/standartScale
                }
            }
        }

    }
}
