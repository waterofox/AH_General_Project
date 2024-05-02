#include "collisiontargetsystem.h"

CollisionTargetSystem::CollisionTargetSystem() {}

bool CollisionTargetSystem::is_collision(int sides)
{

    int minVector = 10000000;
    int target_collision;
    for(int i = 0; i < this->collisions.size(); ++i)
    {
        actual_vector.X = this->collisions[i].cords.X - this->control_a_cords.X;
        actual_vector.Y = this->collisions[i].cords.Y - this->control_a_cords.Y;



        this->buffer_vector = lenght_vector(actual_vector.X,actual_vector.Y);
        if (this->buffer_vector <= minVector)
        {
            target_collision = i;
            minVector = this->buffer_vector;
        }
    }
    int half_r = this->collisions[target_collision].collision_R/2;

    switch (sides) {
    case side::Up:
        if(lenght_vector(actual_vector.X,actual_vector.Y-half_r) <= this->collisions[target_collision].collision_R)
        {
            return false;
        }
        break;
    case side::Down:
        if(lenght_vector(actual_vector.X,actual_vector.Y+half_r) <= this->collisions[target_collision].collision_R)
        {
            return false;
        }
        break;
    case side::Right:
        if(lenght_vector(actual_vector.X+half_r,actual_vector.Y) <= this->collisions[target_collision].collision_R)
        {
            return false;
        }
        break;
    case side::Left:
        if(lenght_vector(actual_vector.X-half_r,actual_vector.Y) <= this->collisions[target_collision].collision_R)
        {
            return false;
        }
        break;
    default:
        break;
    }

    return true;
}

QMap<int, CollisionTargetSystem::collision> CollisionTargetSystem::get_collisions()
{
    return this->collisions;
}

int CollisionTargetSystem::lenght_vector(int x, int y)
{
    return sqrt(pow(x,2)+pow(y,2));
}

void CollisionTargetSystem::add_to_target(int x, int y, int radius, int id)
{
    collision newcol;
    newcol.collision_R = radius;
    newcol.cords.X = x;
    newcol.cords.Y = y;
    this->collisions.insert(id,newcol);
}
