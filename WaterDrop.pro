TEMPLATE = app

QT += qml quick widgets


SOURCES += main.cpp \
    score.cpp


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    score.h

RESOURCES += \
    src.qrc

