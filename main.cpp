#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <score.h>
#include <QDir>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    QQmlApplicationEngine engine;
    QString version = "desktop";

     score* scor = new score();

#ifdef MOBILE
    version = "mobile";
#endif


    engine.rootContext()->setContextProperty("version", version);

    engine.rootContext()->setContextProperty("ttscore", scor);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

