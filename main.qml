import QtQuick 2.5
import QtQuick.Window 2.2
import "assets"


Window {

    id: root
    visible: true
    width: 1200
    height: 720
    color: "white"
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
