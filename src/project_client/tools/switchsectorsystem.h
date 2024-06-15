#ifndef SWITCHSECTORSYSTEM_H
#define SWITCHSECTORSYSTEM_H

#include <QObject>
#include <QDebug>

class SwitchSectorSystem : public QObject
{
    Q_OBJECT

    struct playerCords
    {
        int X = 0;
        int Y = 0;
    };
    struct windowSize
    {
        int height = 360;
        int width = 600;
    };
private:
    playerCords cords;
    int base_h_level = 0;
    int base_v_level = 0;
    windowSize levelS;
public:
    SwitchSectorSystem();
    Q_INVOKABLE void update_player_cords(int x, int y){this->cords.X = x;this->cords.Y = y;}
    Q_INVOKABLE void update_level_size(int height,int width){this->levelS.height = height;this->levelS.width = width;}
    Q_INVOKABLE void check_level();

signals:
    Q_INVOKABLE void go_up();
    Q_INVOKABLE void go_down();
    Q_INVOKABLE void go_left();
    Q_INVOKABLE void go_right();
};

#endif // SWITCHSECTORSYSTEM_H
