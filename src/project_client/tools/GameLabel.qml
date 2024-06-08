import QtQuick 2.15

Item {

    id: root
    width: 100
    height:100
    visible: true
    Rectangle
    {
        anchors.fill: parent
        color: "black"
        Rectangle
        {
            anchors.centerIn: parent
            color: "black"
            width: parent.width-(3*root.width/100)
            height: parent.height-(3*root.height/100)
            border
            {
                color:"white"
                width:2*root.width/100
            }
        }
    }
}
