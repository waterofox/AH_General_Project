import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
Item {
    property int actualHP: value
    RowLayout
    {
        id: interFace
        anchors.fill: parent
        RowLayout
        {
            id:hp_fra
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 35
            Layout.alignment: Qt.AlignTop

            Layout.topMargin: 10
            Layout.leftMargin: 10

            Rectangle
            {
                id:fractionIco

                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.maximumWidth: 35
                Layout.alignment: Qt.AlignLeft

                border
                {
                    color: "white"
                    width: 2
                }

                color:"transparent"
            }
            ColumnLayout
            {
                id: hpArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.maximumWidth: 180
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
                }
            }
        }

    }
}
