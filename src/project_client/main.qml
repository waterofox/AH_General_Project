import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml

ApplicationWindow {
    visible: true
    width: 1200
    height: 720

    function setCurrentIndex(index) {rootHotel.currentIndex = index}

    SwipeView
    {
        id: rootHotel
        currentIndex: 0
        anchors.fill: parent
        SwipeView
        {
            id:rootMainMenu

            function setCurrentIndexMainMenu(index) {rootMainMenu.currentIndex = index}

            currentIndex: 0
            width: rootHotel.width
            height: rootHotel.height
        }
        SwipeView
        {
            id:rootGame

            function setCurrentIndeGame(index) {rootGame.currentIndex = index}

            currentIndex: 0
            width: rootHotel.width
            height: rootHotel.height

        }
    }

}
