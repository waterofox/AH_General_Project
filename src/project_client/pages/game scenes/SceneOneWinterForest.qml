import QtQuick 2.15
import "../../tools"
import "../../actors"
GameScene
{

    //place for our actors on game scene
    /*
      Сюда следует размещать актёров и квесты для создания рабочей игровой сцены.

      Каждый АКТЁР представляет из себя отдельный новый слой. Учитывайте это, когда будете продумывать порядок добавления их на игровую сцену

      Каждый КВЕСТ создаётся в последовательности, которая тянется снизу ввурх. (Т.е вверх по коду).
    */
    StaticActor
    {
        actualSize: 300
        actualXCord:140
        actualYCord:0
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/roadV.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:140
        actualYCord:300
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/roadV.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:140
        actualYCord:600
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/roadV.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:140
        actualYCord:900
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/roadHV.png'
    }


    StaticActor
    {
        actualSize: 300
        actualXCord:-150
        actualYCord:-380
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord: 10
        actualYCord: -290
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka2.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:-70
        actualYCord: -230
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka3.png'
    }
/////////////////////////////////////////////////////////////////ACTOR_CONTROLLER//////////////////////////////////////////////////////////
    ActorController
    {
        id:player
        actualW: 60
        actualH: 100
        actualX: 265
        actualY: 220
        actualSpeed: 4
        spriteSize: 200
        moveDownSprite: "qrc:/ani/GameAssets/animations/movef.gif"
        moveUpSprite: "qrc:/ani/GameAssets/animations/moveb.gif"
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    StaticActor
    {
        actualSize: 300
        actualXCord:-150
        actualYCord:-80
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord: 10
        actualYCord: 10
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka2.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:-70
        actualYCord: 70
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka3.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:-150
        actualYCord: 220
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord: 10
        actualYCord: 310
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka2.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:-70
        actualYCord: 370
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka3.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:-150
        actualYCord: 520
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord: 10
        actualYCord: 610
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka2.png'
    }
    StaticActor
    {
        actualSize: 300
        actualXCord:-70
        actualYCord: 670
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/terrain/elka3.png'
    }

    ///

    QuestArea
    {
        id:testQuest
        aColor: "transparent"
        aSize: 200
        aX: 100
        aY: 450

        isActive: true
        int_id: 0
        pred: -1

        text: "Hello Stranger!/Nice to meet you!/You should visit our beautiful town.../Wich name is 'Foxville'!/Good Luck!/"
    }

    StaticActor
    {
        actualSize: 200
        actualXCord: 100
        actualYCord: 450
        actualColor: "transparent"
        spriteSource: "qrc:/ani/GameAssets/animations/idle/ahIdle.png"
        spriteframeCount: 10
    }
}
