import QtQuick 2.0

Item {

    id : game
    visible: false
    Item {

        anchors.fill: parent
        focus: true

        Keys.onPressed: {

            if (event.key === Qt.Key_Left) {

                imgwater.x -=60
                event.accepted = true;
            }

            if (event.key === Qt.Key_Right) {

                imgwater.x +=60
                event.accepted = true;
            }
        }
    }

    Rectangle{

        id: background

        width: 1200
        height: 900
        color: "white"
        Rectangle{

            width: parent.width
            height: 60
            color : "#5A8AD1"
            anchors.bottom: parent.bottom

        }

        Water {

            id : imgwater

        }
    }
}
