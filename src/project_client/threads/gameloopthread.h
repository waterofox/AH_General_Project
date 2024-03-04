#ifndef GAMELOOPTHREAD_H
#define GAMELOOPTHREAD_H
#include <iostream>
#include <QObject>
#include <QThread>

class gameLoopThread : public QThread
{
    Q_OBJECT
public:
    gameLoopThread();
    ~gameLoopThread();
    void run() override;
};

#endif // GAMELOOPTHREAD_H
