import QtQuick
import QtQuick.Controls
import QtQml
import "pages"
import "actors"
ApplicationWindow {
    visible: true
    width: 600
    height: 360
    function setCurrentIndex(index) {rootHotel.currentIndex = index}


    SwipeView
    {
        id: rootHotel
        currentIndex: 1
        anchors.fill: parent
        interactive: false

        focus: true
        SwipeView
        {
            id:rootMainMenu

            function setCurrentIndexMainMenu(index) {rootMainMenu.currentIndex = index}

            currentIndex: 0
            width: rootHotel.width
            height: rootHotel.height
            interactive: false

            MainMenu
            {
                pWidth: rootMainMenu.width
                pHeight: rootMainMenu.height
            }
        }
        SwipeView
        {
            id:rootGame

            function setCurrentIndeGame(index) {rootGame.currentIndex = index}

            currentIndex: 0
            width: rootHotel.width
            height: rootHotel.height
            interactive: false

            Rectangle
            {
                color:"green"
                width: rootGame.width
                height: rootGame.height

                focus: true
                Keys.onPressed: actoris.pressed(event)
                Keys.onReleased: actoris.released(event)
                ActorController
                {
                    id: actoris
                    pWidth: rootGame.width
                    pHeight: rootGame.height
                }
            }
        }
    }

}
