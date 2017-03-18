import QtQuick 2.0

Item {

    id : game
    visible: false
    property int counter:0
    property int move:30
    property int flag:0

    function test ()
    {
        if (imgwater.y<imagwaterdropp.y+50 && imgwater.y>imagwaterdropp.y-50  && imgwater.x<imagwaterdropp.x+50 &&imgwater.x>imagwaterdropp.x-50 )
        {
            imagwaterdropp.x = game.getNumber();
            imagwaterdropp.y=-200;
            counter = counter + 1;
            anim.restart();

            if (counter>1 && counter<10)
            {

                anim.duration = 2500
            }
            if (counter>10 && counter<15)
            {

                anim.duration = 2200
            }

            if (counter>15 && counter<20)
            {

                anim.duration = 2000
            }
            if (counter>20 && counter<25)
            {

                anim.duration = 1900
            }
            if (counter ==2)
            {
                imagebad.y=-200;
                imagebad.x = game.getNumber();
                imagebad.visible =true
                animbad.restart();

            }

            if (counter ==5)
            {
                imageboost.y=-200;
                imageboost.x = game.getNumber();
                imageboost.visible =true
                animboost.restart();
            }

        }
        if ((imagwaterdropp.y>(imgwater.y+20)) && counter>0)
        {
            start.state = "visible"
            animbad.stop()
            animboost.stop()
            imagebad.x=-500
            imagebad.y=-200
            imageboost.x=-500
            imageboost.y=-200
        }
    }

    function ral ()
    {

        if ((imagebad.y>(imgwater.y+20)))
        {

            imagebad.y=-200;
            imagebad.x = game.getNumber();
            animbad.restart();
        }


        if (imgwater.y<imagebad.y+50 && imgwater.y>imagebad.y-50  && imgwater.x<imagebad.x+50 &&imgwater.x>imagebad.x-50 )
        {

            animbad.stop()        
            speed.duration =70
            imagebad.x=-500
            imagebad.y=-200
        }

    }
    function boost ()
    {

        if ((imageboost.y>(imgwater.y+20)))
        {

            imageboost.y=-200;
            imageboost.x = game.getNumber();
            animboost.restart();
        }


        if (imgwater.y<imageboost.y+50 && imgwater.y>imageboost.y-50  && imgwater.x<imageboost.x+50 &&imgwater.x>imageboost.x-50 )
        {

            animboost.stop()
            move+=20
            speed.duration = 30
            imageboost.x=-500
            imageboost.y=-200
        }

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

                imgwater.x -=move
                event.accepted = true;
                test();
            }

            if (event.key === Qt.Key_Right) {

                imgwater.x +=move
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
            id : ground
            z : 2

            width: parent.width
            height: 60
            color : "#5A8AD1"
            anchors.bottom: parent.bottom

        }

        Water {

            z :2
            id : imgwater
            Behavior on x { NumberAnimation { id:speed ;duration: 50 } }

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
            y : -200

            source: "assets/drop.png"
            fillMode: Image.Stretch

            PropertyAnimation on y { id :anim; from: imagwaterdropp.y;to: ground.y; duration: 3000; loops: Animation.Infinite }
            onYChanged: {

                test();
            }
        }
        Image {

            id : imagebad
            width: 85
            height: 85
            x : -500
            y : -200
            visible: false

            source: "assets/bad.png"
            fillMode: Image.Stretch

            PropertyAnimation on y { id :animbad; from: imagebad.y;to: ground.y; duration: 6000; loops: Animation.Infinite }
            onYChanged: {
                ral();
            }
        }
        Image {

            id : imageboost
            width: 75
            height: 95
            x : -500
            y : -200
            visible: false

            source: "assets/boost.png"
            fillMode: Image.Stretch

            PropertyAnimation on y { id :animboost; from: imageboost.y;to: ground.y; duration: 5000; loops: Animation.Infinite }
            onYChanged: {
                boost();
            }
        }
    }
}
