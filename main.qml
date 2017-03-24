import QtQuick 2.5
import QtQuick.Window 2.2



Window {

    id: root
    visible: true
    width: 1200
    height: 720
    color: "#CEE3F6"
     visibility: version === "mobile" ? "FullScreen" : "Windowed"


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
