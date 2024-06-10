import QtQuick 2.15
import "../actors"
Item {

    property int cppId: 0

    property int collisionX: (parent.actualSize/2+parent.actualXCord)*parent.forsW/standartScale
    property int collisionY: (parent.actualSize/2+parent.actualYCord)*parent.forsH/standartScaleY

    property bool activeCollision: true

    signal newCollision(int x, int y)

    Component.onCompleted: {
        if(!activeCollision){return}
        targetSystem.add_to_target(collisionX,collisionY,parent.scaledWidth/2,cppId)
    }
    onCollisionXChanged: {if(!activeCollision){return};targetSystem.reRender_coords(collisionX,collisionY,parent.scaledWidth/2,cppId); console.log(collisionX,collisionY)}
    onCollisionYChanged: {if(!activeCollision){return};targetSystem.reRender_coords(collisionX,collisionY,parent.scaledWidth/2,cppId); console.log(collisionX,collisionY)}

}
