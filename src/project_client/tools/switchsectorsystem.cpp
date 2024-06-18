#include "switchsectorsystem.h"

SwitchSectorSystem::SwitchSectorSystem() {}

void SwitchSectorSystem::check_level()
{
    int rez = this->base_h_level;
    rez = this->cords.X/this->levelS.width;
    if(rez != this->base_h_level)
    {
        if(rez > this->base_h_level){emit this->goRight();}
        else{emit this->goLeft();}
        this->base_h_level = rez;
        qDebug() << "actual level is: " << this->base_h_level << ' ' << this->base_v_level;
    }

    rez = this->cords.Y/this->levelS.height;
    if(rez != this->base_v_level)
    {
        if(rez > this->base_v_level){emit this->goDown();}
        else{emit this->goUp();}
        this->base_v_level = rez;
        qDebug() << "actual level is: " << this->base_h_level << ' ' << this->base_v_level;
    }
}
