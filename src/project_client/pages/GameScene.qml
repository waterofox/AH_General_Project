import QtQuick 2.15
import QtQuick.Layouts

import "../actors"

Item {
    visible: true
    property int pWidth: 0
    property int pHeight: 0

    function eventPressedFilter(event)
    {
        actoris.pressed(event);
    }
    function eventReleasedFilter(event)
    {
        actoris.released(event)
    }
    width: pWidth
    height: pHeight
    //todo блять оптимизуруй код. Это пиздец. заверни всё это во актёра
    RowLayout
    {
        id: staticArea
        anchors.fill: parent

        StaticActor
        {
            id:actorst
            visible: true
            pWight: parent.width
            pHeight: parent.height
            actualSize: 100
            actualXCord: 200
            actualYCord: 200

            Layout.maximumHeight: actorst.actualSize*staticArea.height/standartScaleY
            Layout.maximumWidth:  actorst.actualSize*staticArea.width /standartScale

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.topMargin: actorst.actualYCord*staticArea.height/standartScaleY
            Layout.leftMargin: actorst.actualXCord*staticArea.width/standartScale
        }
    }
    RowLayout
    {
        anchors.fill: parent
        id: staticArea2

        StaticActor
        {
            id:testActorSt
            visible: true
            pWight: parent.width
            pHeight: parent.height
            actualSize: 50
            actualXCord: 10
            actualYCord: 10
            actualColor: "blue"
            Layout.maximumHeight: testActorSt.actualSize*staticArea.height/standartScaleY
            Layout.maximumWidth:  testActorSt.actualSize*staticArea.width /standartScale

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.alignment: Qt.AlignTop
            Layout.topMargin:  testActorSt.actualYCord*staticArea.height/standartScaleY
            Layout.leftMargin: testActorSt.actualXCord*staticArea.width/standartScale
        }
    }

    ActorController
    {
        id: actoris
        pWidth: rootGame.width
        pHeight: rootGame.height
    }
    //ПРОГРАММИСТ ОТОШЁЛ СРАТЬ
}
