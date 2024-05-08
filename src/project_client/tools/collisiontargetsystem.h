#ifndef COLLISIONTARGETSYSTEM_H
#define COLLISIONTARGETSYSTEM_H
#include <QList>
#include <QMap>
#include <math.h>
#include <QObject>
#include <QDebug>
class CollisionTargetSystem : public QObject
{
    Q_OBJECT
private:
    struct actor_cords
    {
        int X = 0;
        int Y = 0;
        bool operator== (const actor_cords&a) const
        {
            if ((a.X == this->X) && (a.Y == this->Y))
            {
                return true;
            }
            return false;
        }
    };
    struct collision
    {
        actor_cords cords;
        int collision_R = 0;

        bool operator==(const collision&a) const
        {
            if((a.collision_R == this->collision_R) && (a.cords == this->cords) )
            {
                return true;
            }
            return false;
        }
    };

    actor_cords control_a_cords;
    actor_cords actual_vector;
    QMap<int,collision> collisions;

    int buffer_x = 0;
    int buffer_y = 0;
    int buffer_vector = 0;

    int targeted_collision = 0;
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
    Q_INVOKABLE int get_targeted_collision();
    Q_INVOKABLE void reRender_coords(int xCord, int yCord, int radius, int id);
    Q_INVOKABLE void update_actor_cordX(int X){this->control_a_cords.X = X;}
    Q_INVOKABLE void update_actor_cordY(int Y){this->control_a_cords.Y = Y;}

    collision& operator=(collision&a)
    {
        collision* b = new collision;
        b->collision_R = a.collision_R;
        b->cords.X = a.cords.X;
        b->cords.Y = a.cords.Y;
        return *b;
    }
};

#endif // COLLISIONTARGETSYSTEM_H
