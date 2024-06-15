#include "switchsectorsystem.h"

SwitchSectorSystem::SwitchSectorSystem() {}

void SwitchSectorSystem::check_level()
{
    int rez = this->base_h_level;
    rez = this->cords.X/this->levelS.width;
    if(rez != this->base_h_level)
    {
        if(rez > this->base_h_level){emit this->go_right();}
        else{emit this->go_left();}
        this->base_h_level = rez;
        qDebug() << "actual level is: " << this->base_h_level << ' ' << this->base_v_level;
    }

    rez = this->cords.Y/this->levelS.height;
    if(rez != this->base_v_level)
    {
        if(rez > this->base_v_level){emit this->go_down();}
        else{emit this->go_up();}
        this->base_v_level = rez;
        qDebug() << "actual level is: " << this->base_h_level << ' ' << this->base_v_level;
    }
}
