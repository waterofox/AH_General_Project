import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
ApplicationWindow{

    height: 300
    width: 500
    color: "white"
    visible: true
    title: qsTr("AH General Project Desktop Alpha")
    RowLayout
    {
        anchors.fill: parent
        id: root

        Text {
            id: hello
            text: qsTr("Hello! AND YES! I DID IT!")
            Layout.alignment: Qt.AlignCenter
        }
    }

}
