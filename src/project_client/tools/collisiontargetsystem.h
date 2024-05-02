#ifndef COLLISIONTARGETSYSTEM_H
#define COLLISIONTARGETSYSTEM_H
#include <QList>
#include <QMap>
#include <math.h>
#include <QObject>
class CollisionTargetSystem : public QObject
{
    Q_OBJECT
private:
    struct actor_cords
    {
        int X = 0;
        int Y = 0;
    };
    struct collision
    {
        actor_cords cords;
        int collision_R = 0;
    };

    actor_cords control_a_cords;
    actor_cords actual_vector;
    QMap<int,collision> collisions;

    int buffer_x = 0;
    int buffer_y = 0;
    int buffer_vector = 0;
public:
    enum side
    {
        Up = 0,
        Down = 1,
        Right = 2,
        Left = 3,
    };
    Q_ENUMS(side)

    CollisionTargetSystem();
    int lenght_vector(int x ,int y);

    Q_INVOKABLE bool is_collision(int);
    Q_INVOKABLE int test() {return this->collisions.size();}
    Q_INVOKABLE QMap<int,collision> get_collisions();
    Q_INVOKABLE void add_to_target(int x, int y, int radius, int id);
};

#endif // COLLISIONTARGETSYSTEM_H
