#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <score.h>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    score scor;

     QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("ttscore", &scor);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

