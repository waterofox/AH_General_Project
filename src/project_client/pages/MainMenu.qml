import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Item {
    visible: true
    property int pWidth: 0
    property int pHeight: 0

    width: pWidth
    height: pHeight

    RowLayout
    {
        id:mainPageMainMenu
        anchors.fill: parent

        ColumnLayout
        {
            id:buttonsArea
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Rectangle
        {
            id:contenArea
            Layout.fillHeight: true
            Layout.fillWidth: true

            border
            {
                color:"black"
                width: 3
            }
        }

    }

}
