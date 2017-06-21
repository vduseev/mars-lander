#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "mapfile.h"

static QObject *mapfile_singleton_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    MapFile *mapfile = new MapFile();
    return mapfile;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qmlRegisterSingletonType<MapFile>("MapEditor.Utilities", 1, 0, "MapFile", mapfile_singleton_provider);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
