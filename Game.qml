import QtQuick 2.0

Item {

    id : game
    visible: false
    property int counter:0
    property int counter2:0
    property int counter3:0
    property int plus:0
    property int flag:0
    property int flag2:0
    width: root.width
    height: root.height


    function test ()
    {
        if (imgwater.y<imagwaterdropp.y+40 && imgwater.x<imagwaterdropp.x+40 &&imgwater.x>imagwaterdropp.x-40 )
        {
            imagwaterdropp.x = game.getNumber();
            imagwaterdropp.y=-200;
            counter = counter + 1;
            anim.restart();

            if (counter==1)
            {
                anim.duration = 3000
                counter3=counter;
            }
            if (counter-counter3==8)
            {

                if (anim.duration<=1100)
                {
                    anim.duration=1100;
                }
                else{

                    anim.duration -= 200;
                    counter3=counter;
                }
                if (flag==0)
                {
                    imagebad.y=-200;
                    imagebad.x = game.getNumber();
                    imagebad.visible =true
                    animbad.restart();
                    flag=1;
                }
                if (flag2==0)
                {
                    imageboost.y=-200;
                    imageboost.x = game.getNumber();
                    imageboost.visible =true
                    animboost.restart();
                    flag2=1;
                }
            }


            if (counter == 25)
            {
                imagwaterdropp2.y=-200;
                imagwaterdropp2.x = game.getNumber();
                imagwaterdropp2.visible =true
                anim2.restart();
            }
        }

        if((imagwaterdropp.y>(imgwater.y+20)) && counter>0)
        {
            counter2 = counter
            plus = ttscore.readfile()
            if (counter>plus)
            {
            ttscore.writefile(counter)
            }
            animbad.stop()
            animboost.stop()
            imagebad.x=-500
            imagebad.y=-200
            imageboost.x=-500
            imageboost.y=-200
            imagwaterdropp2.x=-500
            imagwaterdropp2.y=-200
            anim.duration = 5000
            start.state = "visible"
        }
    }
    function test2 ()
    {
        if (imgwater.y<imagwaterdropp2.y+40 && imgwater.x<imagwaterdropp2.x+40 &&imgwater.x>imagwaterdropp2.x-40 )
        {
            imagwaterdropp2.x = game.getNumber();
            imagwaterdropp2.y=-200;
            counter = counter + 1;
            anim2.restart();
        }

        if((imagwaterdropp2.y>(imgwater.y+20)) && counter>0 && imagwaterdropp2.state=="visibile")
        {
            counter2 = counter
            plus = ttscore.readfile()
            if (counter>plus)
            {
            ttscore.writefile(counter)
            }
            anim.duration = 5000
            start.state = "visible"
            animbad.stop()
            animboost.stop()
            imagebad.x=-500
            imagebad.y=-200
            imageboost.x=-500
            imageboost.y=-200
            imagwaterdropp2.x=-500
            imagwaterdropp2.y=-200

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
            anim.duration += 200
            imagebad.x=-500
            imagebad.y=-200
            flag=0
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
            anim.duration -=200
            imageboost.x=-500
            imageboost.y=-200
            flag2=0;
        }

    }
    function randomNumber() {
        return Math.random()*(root.width/1.25);
    }

    function getNumber() {
        return game.randomNumber();
    }


    Rectangle{

        id: background

        width: root.width
        height:root.height
        anchors.bottom: parent.bottom
        color: "#CEE3F6"


        Rectangle{
            id : ground
            z : 2

            width: parent.width
            height: 60
            color : "#5A8AD1"
            anchors.bottom: background.bottom


        }



        Water {

            z :2
            id : imgwater
            Behavior on x { NumberAnimation { id:speed ;duration: 60 } }

            MouseArea {
                focus: true
                id: liverbirdMouseArea
                anchors.fill: parent

                property int startX

                onPressed: {
                    startX = mouseX

                }
                onPositionChanged: {
                    imgwater.x += mouseX + startX

                    startX = mouseX

                }
            }
        }
        Text{

            id: score
            anchors.top: parent.top
            anchors.left : parent.left

            font.pointSize: 30
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

            PropertyAnimation on y { id :anim; from: imagwaterdropp.y;to: ground.y; duration: 5000; loops: Animation.Infinite }
            onYChanged: {
                test();
            }
        }
        Image {

            id : imagwaterdropp2
            width: 95
            height: 95
            x : -500
            y : -200
            visible : false

            source: "assets/drop.png"
            fillMode: Image.Stretch

            PropertyAnimation on y { id :anim2; from: imagwaterdropp2.y;to: ground.y; duration: 2700; loops: Animation.Infinite }
            onYChanged: {

                test2();

            }
        }
        Image {

            id : imagebad
            width: 75
            height: 75
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
            width: 65
            height: 85
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
