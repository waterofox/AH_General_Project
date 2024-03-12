#ifndef AHACTOR2D_H
#define AHACTOR2D_H
#include <QObject>
class AHActor2D
{

    Q_OBJECT
    struct cordinates
    {
       double xSize = 0.0;
       double ySize = 0.0;
    };
private:
    QString    texturePath = "";       // texture
    cordinates       activeArea;       // считать как радиусы от центра. Должны быть больше радиуса фигуры!
    cordinates actorRelPosition;       // настоящее положение(местонахождение) актёра на плоскости
    bool         Active = false;       //отвечает за возможность взаимодействия с актёром

public:

    AHActor2D ();
    ~AHActor2D();

    //setters
    void setArea    (             const int& x, const int& y);
    void setTexture (                 const QString& newPath);
    void setActFlag (                     const bool& newArg);
    void switchFlag                                        ();
    void setActorRelPositon(const double& x, const double& y);

    //virtual
    virtual void script() = 0; // код который будет отрабатывать по вызову сигнала, если Active == true

    //getters
    QList<double>       getArea();
    QList<double>getRelPosition();
    QString      getTexturePath();
    bool               isActive();


signals:
    void entered    (); //воспроизводиться, когда другой актёр заходит в  ActiveArea
    void getOut     (); //воспроизводиться, когда другой актёр выходит из ActiveArea
    void startScript(); //воспроизводиться перед запуском скрипта

public slots:
    void onEntered     ();
    void onGetOut      ();
    void onStrartScript();
};

#endif // AHACTOR2D_H
