TEMPLATE = app

QT += qml quick


SOURCES += main.cpp


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    main.qml \
    Water.qml

