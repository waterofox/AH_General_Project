import QtQuick 2.15

Rectangle
{
    id:sceneRoot

    property int sceneWidth: 600
    property int sceneHeight: 1080

    width: sceneWidth*pWidth/standartScale
    height: sceneHeight*pHeight/standartScaleY
    color: "transparent"
}
