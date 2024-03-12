#include "ahactor2d.h"

AHActor2D::AHActor2D() {}

AHActor2D::~AHActor2D(){}

void AHActor2D::setArea(const int &x, const int &y)
{
    this->activeArea.xSize = x;
    this->activeArea.ySize = y;
}

void AHActor2D::setTexture(const QString &newPath)
{
    this->texturePath = newPath;
}

void AHActor2D::setActFlag(const bool &newArg)
{
    this->Active = newArg;
}

void AHActor2D::switchFlag()
{
    this->Active = !this->Active;
}

void AHActor2D::setActorRelPositon(const double &x, const double &y)
{
    this->actorRelPosition.xSize = x;
    this->actorRelPosition.ySize = y;
}

QList<double> AHActor2D::getArea()
{
    QList<double> huh;
    huh.append(this->activeArea.xSize);
    huh.append(this->activeArea.ySize);
    return huh;
}

QList<double> AHActor2D::getRelPosition()
{
    QList<double> huh;
    huh.append(this->actorRelPosition.xSize);
    huh.append(this->actorRelPosition.ySize);
    return huh;
}

bool AHActor2D::isActive()
{
    return this->Active;
}

void AHActor2D::onEntered()
{
    this->switchFlag();
}

void AHActor2D::onGetOut()
{
    this->switchFlag();
}

void AHActor2D::onStrartScript()
{
    this->script();
}
