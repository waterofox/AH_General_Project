import QtQuick 2.15
import QtQuick.Layouts
import CTS 1.0
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

    Component.onCompleted: {}
    CollisionTargetSystem
    {
        id:targetSystem
    }

    width: parent.width
    height: parent.height

    StaticActor
    {
        id:actorst
        actualSize: 100
        actualXCord: 200
        actualYCord: 200
        cppId: 0
        //to do покамест у меня квадратики не париться и сделать как есть коллизию. Потом нужно её сделать ввиде отдедьного компонента
        Component.onCompleted: {
            targetSystem.add_to_target(collisionX,collisionY,width/2,cppId)
            console.log(targetSystem.test())
        }
    }

    StaticActor
    {
        id:actorst2
        actualSize: 100
        actualXCord: 50
        actualYCord: 50
        actualColor: "red"
        cppId: 1
        //to do покамест у меня квадратики не париться и сделать как есть коллизию. Потом нужно её сделать ввиде отдедьного компонента
        Component.onCompleted: {
            targetSystem.add_to_target(collisionX,collisionY,width/2,cppId)
            console.log(targetSystem.test())
        }
    }

    StaticActor
    {
        id:actorst3
        actualSize: 60
        actualXCord: 400
        actualYCord: 70
        actualColor: "blue"
        cppId: 2
        //to do покамест у меня квадратики не париться и сделать как есть коллизию. Потом нужно её сделать ввиде отдедьного компонента
        Component.onCompleted: {
            targetSystem.add_to_target(collisionX,collisionY,width/2,cppId)
            console.log(targetSystem.test())
        }
    }

    ActorController
    {
        id: actoris
    }
}
