#ifndef COLLISIONTARGETSYSTEM_H
#define COLLISIONTARGETSYSTEM_H
#include <QList>
#include <math.h>
#include <QObject>
class CollisionTargetSystem : public QObject
{
    Q_OBJECT

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
    enum side
    {
        Up = 0,
        Down = 1,
        Right = 2,
        Left = 3,
    };
private:
    actor_cords control_a_cords;
    actor_cords actual_vector;
    QList<collision> collisions;

    int buffer_x = 0;
    int buffer_y = 0;
    int buffer_vector = 0;

public:
    CollisionTargetSystem();

    bool is_collision(int);

    int lenght_vector(int x ,int y);

    Q_INVOKABLE QString test() {return "test";}
};

#endif // COLLISIONTARGETSYSTEM_H
