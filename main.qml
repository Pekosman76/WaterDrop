import QtQuick 2.5
import QtQuick.Window 2.2

Window {

    visible: true
    width: 1200
    height: 900
    color: "white"

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2);
        setY(Screen.height / 2 - height / 2);
    }


    Start{
        id: start
        visible: true
        anchors.centerIn: parent
    }

    Game{

        id : game1
        visible : false
    }


}
