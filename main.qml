import QtQuick 2.5
import QtQuick.Window 2.2

Window {

    visible: true
    width: 1200
    height: 800
    color: "white"



    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2);
        setY(Screen.height / 2 - height / 2);
    }

    Item {

        anchors.fill: parent
        focus: true

        Keys.onPressed: {

            if (event.key === Qt.Key_Left) {
                console.log("move left");
                imgwater.x -=30
                event.accepted = true;
            }

            if (event.key === Qt.Key_Right) {
                console.log("move left");
                imgwater.x +=30
                event.accepted = true;
            }
        }
    }

    Rectangle{

        id: background

        width: 1200
        height: 800
        color: "white"

        Water {

          id : imgwater

        }
    }
}
