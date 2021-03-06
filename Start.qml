import QtQuick 2.0

Item {
width: root.width
height: root.height


    states: [
        State {
            name: "notvisible"
            PropertyChanges {
                target: start; visible:false }
            PropertyChanges {
                target: game1; visible:true }
            PropertyChanges {
                target: game1; counter:0 }
        },
        State {
            name: "visible"
            PropertyChanges {
                target: start; visible:true }
            PropertyChanges {
                target: game1; visible:false }
            PropertyChanges {
                target: game1; counter:0 }
            PropertyChanges {
                target: score; text: "BestScore :"+ ttscore.readfile() }
        }

    ]
    transitions:
        Transition {
        from: ""; to: "notvisible"
        PropertyAnimation { property :"visible";duration: 500;easing.type: Easing.InOutQuad }


    }


    Text{

        id: starttext
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom : startbutton.top
        anchors.bottomMargin: 200

        font.pointSize: 20
        color : "#5A8AD1"
        font.bold: true
        text: qsTr("WELCOME SMALL DROP")

    }
    Text{

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom : startbutton.top
        anchors.bottomMargin: 100

        font.pointSize: 20
        color : "#5A8AD1"
        font.bold: true
        text: qsTr("ARE YOU READY ?")

    }
    Rectangle{

        id: startbutton
        anchors.centerIn: parent
        width: parent.width/4
        height: parent.height/9
        color : "#5A8AD1"
        border.color: "white"
        border.width: 5
        radius: 10

        MouseArea {
            anchors.fill: parent
            onClicked: { start.state = "notvisible"}
        }


        Text {

            anchors.centerIn: parent
            font.pointSize: 25
            color : "white"
            font.bold: true
            text: qsTr("PLAY")
        }

    }


    Image {
        id : imagwaterdrop
        width: 70
        height: 95
        anchors.top : startbutton.bottom
        anchors.horizontalCenter: startbutton.horizontalCenter
        anchors.topMargin: 50

        source: "assets/images.png"

    }

    Image {
        id : imagwaterdrop2
        width: 95
        height: 95
        anchors.left: parent.left
        y: starttext.y
        source: "assets/drop.png"
        fillMode: Image.Stretch
        PropertyAnimation on y { from: imagwaterdrop2.y;to: imagwaterdrop.y; duration: 2500; loops: Animation.Infinite }
    }

    Image {
        id : imagwaterdrop3
        width: 95
        height: 95
        anchors.right: parent.right
        y: starttext.y
        source: "assets/drop.png"
        fillMode: Image.Stretch
        PropertyAnimation on y { from: imagwaterdrop3.y;to: imagwaterdrop.y; duration: 2500; loops: Animation.Infinite }
    }

    Text{

        id: score
        anchors.top: imagwaterdrop.bottom
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.topMargin: 20

        font.pointSize: 30
        color : "#5A8AD1"
        font.bold: true
        text: "Best Score :"+ttscore.readfile()

    }



}
