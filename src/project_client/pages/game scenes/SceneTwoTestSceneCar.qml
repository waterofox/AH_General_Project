import QtQuick 2.15
import "../../tools"
import "../../actors"
import CTS
import QuestM
GameScene
{
    color: '#E4ECEC'
    CollisionTargetSystem
    {
        id:targetSystem
    }
    QuestManger
    {
        id:questManager
    }
    //place for our actors on game scene
    /*
      Сюда следует размещать актёров и квесты для создания рабочей игровой сцены.

      Каждый АКТЁР представляет из себя отдельный новый слой. Учитывайте это, когда будете продумывать порядок добавления их на игровую сцену

      Каждый КВЕСТ создаётся в последовательности, которая тянется снизу ввурх. (Т.е вверх по коду).
    */
    StaticActor
    {
        actualSize: 90
        actualXCord:90
        actualYCord:90
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/buildings/blueCar00.png'
        CollisionRad
        {
            activeCollision: true
            cppId: 0
        }
    }
    StaticActor
    {
        actualSize: 90
        actualXCord:180
        actualYCord:90
        actualColor: "transparent"
        spriteSource: 'qrc:/res/GameAssets/statickAssets/buildings/blueCar10.png'
        CollisionRad
        {
            activeCollision: true
            cppId: 1
        }
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

    ///


}
