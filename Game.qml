import QtQuick 2.0

Item {
    id : game
    visible: false

    function test ()
    {

        if (imgwater.y<imagwaterdropp.y+50 && imgwater.y>imagwaterdropp.y-50  && imgwater.x<imagwaterdropp.x+50 &&imgwater.x>imagwaterdropp.x-50 )
        {
            imagwaterdropp.state = "goal"

        }


    }
    Item {

        anchors.fill: parent
        focus: true

        Keys.onPressed: {

            if (event.key === Qt.Key_Left) {

                imgwater.x -=20
                event.accepted = true;
            }

            if (event.key === Qt.Key_Right) {

                imgwater.x +=20
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

            z :2
            id : imgwater

        }

        Image {

            id : imagwaterdropp
            width: 95
            height: 95
            x :  150

            source: "assets/drop.png"
            fillMode: Image.Stretch
            PropertyAnimation on y { from: imagwaterdropp.y;to: imgwater.y; duration: 2500; loops: Animation.Infinite }



           states: [
                State {
                    name: "goal"
                    PropertyChanges {
                        target: imagwaterdropp; x:500 }

                }
            ]

        }
    }
}
