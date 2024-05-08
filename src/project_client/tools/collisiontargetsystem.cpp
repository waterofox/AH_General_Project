#include "collisiontargetsystem.h"

CollisionTargetSystem::CollisionTargetSystem() {}

bool CollisionTargetSystem::is_collision(int sides)
{

    int minVector = 10000000;
    int target_collision = 0;
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

    targeted_collision = collisions.key(collisions[target_collision]);
    actual_vector.X = this->collisions.value(targeted_collision).cords.X - this->control_a_cords.X;
    actual_vector.Y = this->collisions.value(targeted_collision).cords.Y - this->control_a_cords.Y;

    switch (sides) {
    case side::Up:
        if(lenght_vector(actual_vector.X,actual_vector.Y) <= this->collisions[targeted_collision].collision_R){return true;}
        break;
    case side::Down:
        if(lenght_vector(actual_vector.X,actual_vector.Y) <= this->collisions[targeted_collision].collision_R){return true;}
        break;
    case side::Right:
        if(lenght_vector(actual_vector.X,actual_vector.Y) <= this->collisions[targeted_collision].collision_R){return true;}
        break;
    case side::Left:
        if(lenght_vector(actual_vector.X,actual_vector.Y) <= this->collisions[targeted_collision].collision_R){return true;}
        break;
    default:
        break;
    }

    return false;
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

int CollisionTargetSystem::get_targeted_collision()
{
    return this->targeted_collision;
}

void CollisionTargetSystem::reRender_coords(int xCord, int yCord, int radius, int id)
{
    this->collisions.remove(id);
    add_to_target(xCord,yCord,radius,id);
}
