TEMPLATE = app

QT += qml quick widgets


SOURCES += main.cpp \
    score.cpp

android {
    DEFINES += MOBILE
}
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

RESOURCES += \
    src.qrc

HEADERS += \
    score.h

