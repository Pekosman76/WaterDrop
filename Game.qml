import QtQuick 2.0

Item {
    id : game
    visible: false
    property int counter:0

    function test ()
    {

        if (imgwater.y<imagwaterdropp.y+50 && imgwater.y>imagwaterdropp.y-50  && imgwater.x<imagwaterdropp.x+50 &&imgwater.x>imagwaterdropp.x-50 )
        {
            imagwaterdropp.x = game.getNumber();
            imagwaterdropp.y=0;
            counter = counter + 1;
            anim.restart();
        }


    }
    function test2 ()
    {

        var qml= new Array (200,300,400,500,600,700)

        var bg = qml[Math.floor(qml.length*Math.random)]
        return bg

    }
    function randomNumber() {
        return Math.random()*950;
    }

    function getNumber() {
        return game.randomNumber();
    }


    Item {

        anchors.fill: parent
        focus: true

        Keys.onPressed: {

            if (event.key === Qt.Key_Left) {

                imgwater.x -=20
                event.accepted = true;
                test();
            }

            if (event.key === Qt.Key_Right) {

                imgwater.x +=20
                event.accepted = true;
                test();
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

            z :2
            id : imgwater

        }
        Text{

            id: score
            anchors.top: parent.top
            anchors.left : parent.left


            font.pointSize: 15
            color : "#5A8AD1"
            font.bold: true
            text: "Score : "+ game.counter

        }

        Image {

            id : imagwaterdropp
            width: 95
            height: 95
            x : 150

            source: "assets/drop.png"
            fillMode: Image.Stretch
            PropertyAnimation on y { id :anim;from: imagwaterdropp.y;to: imgwater.y; duration: 2500; loops: Animation.Infinite }
            onYChanged: {

                test();
            }





        }
    }
}
