import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtQuick.Particles 2.0

Rectangle {
    id: container
    property int percentage: 50
    property real weight: 20
    property int number: 1
    property string kegColor
    color: "transparent"

    Column {
        spacing: 4
        width: container.width
        height: container.height

        Text {
            id: header
            height: 40
            width: container.width
            text: `${Math.round(19 * percentage / 10) / 10}l ${Math.round(weight / 100) / 10}kg`
            font.pixelSize: 24
            color: "white"
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: keg
            width: container.width
            height: container.height - header.height
            color: "#131313"

            MouseArea {
                anchors.fill: parent
                onClicked: function() {
                    ebc.number = number;
                    ebc.folded = !ebc.folded
                    row.visible = false;
                }
            }

            Rectangle {
                id: visualCharge
                anchors.bottom: keg.bottom
                width: parent.width
                height: parent.height * percentage / 100
                clip: true
                color: kegColor

                Behavior on height {
                    NumberAnimation {
                        duration: 1000 //ms
                    }
                }
            }
        }
    }
}
