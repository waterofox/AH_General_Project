#include <QGuiApplication>
#include <QQmlApplicationEngine>
//#include "actors/models/actormodel.h"
//#include "threads/gameloopthread.h"
#include "tools/collisiontargetsystem.h"
#include "tools/switchsectorsystem.h"
#include "tools/questmanager.h"
int main(int argc, char *argv[])
{    
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    qmlRegisterType<CollisionTargetSystem>("CTS",1,0,"CollisionTargetSystem");
    qmlRegisterType<SwitchSectorSystem>("SSS",1,0,"SwitchSectorSystem");
    qmlRegisterType<QuestManager>("QuestM",1,0,"QuestManger");

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();

    return 0;
}
