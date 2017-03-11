import QtQuick 2.0

Image {
    id : imagwaterdrop
    width: 70
    height: 95


    x : (parent.width / 2 - width / 2)
    y: (parent.width/2+width*2 )
    source: "assets/images.png"
    fillMode: Image.Stretch
}

