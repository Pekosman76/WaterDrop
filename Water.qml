import QtQuick 2.0

Image {
    id : imagwaterdrop
    width: 70
    height: 95

    x : root.width/2
    anchors.bottom: ground.top

    source: "assets/images.png"
    fillMode: Image.Stretch
}

