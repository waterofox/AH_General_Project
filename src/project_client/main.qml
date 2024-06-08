import QtQuick
import QtQuick.Controls
import QtQml
import QtQuick.Layouts
import "pages"
import "tools"
ApplicationWindow {
    visible: true
    width: 600
    height: 360
    property double standartScale: 600.0
    property double standartScaleY: 360.0
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
                id:menu
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

            GameScene
            {
                id: index1
                pHeight: rootGame.height
                pWidth:  rootGame.width

                focus: true
                Keys.onPressed: index1.eventPressedFilter(event)
                Keys.onReleased:index1.eventReleasedFilter(event)

            }

        }
    }

    GameLabel
    {

    }
}
