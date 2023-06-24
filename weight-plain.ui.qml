import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

Window {
    property QtObject backend
    property var ebcColors
    property int firstKeg: 50
    property real firstKegWeight: 20
    property int secondKeg: 50
    property real secondKegWeight: 20

    property string firstColor
    property string secondColor

    color: "black"
    signal exitClicked()
    signal colorSelected(number: int, color: string)
    signal resetClicked(number: int)

    Ebc {
        id: ebc
        folded: true
        ebcs: ebcColors
        number: 1
    }

    Row {
        id: row
        x: 8
        y: 8
        width: 784
        height: 464
        spacing: 4

        KegPlain {
            width: (parent.width - 100) / 2
            height: parent.height
            number: 0
            percentage: firstKeg
            weight: firstKegWeight
            kegColor: firstColor
        }

        KegPlain {
            width: (parent.width - 100) / 2
            height: parent.height
            number: 1
            percentage: secondKeg
            weight: secondKegWeight
            kegColor: secondColor
        }

        Column {
            id: column
            width: 100
            height: 464

            Button {
                onClicked: exitClicked()
                id: exitBtn
                x: 0
                y: 21
                text: qsTr("Exit")
            }

            Button {
                onClicked: resetClicked(0)
                id: resetKegOneBtn
                x: 0
                y: 70
                text: qsTr("Reset Keg 1")
            }

            Button {
                onClicked: resetClicked(1)
                id: resetKegTwoButton
                x: 0
                y: 120
                text: qsTr("Reset Keg 2")
            }
        }
    }

    Connections {
        target: backend

        function onWeight(input) {
            if (input.number === 0) {
                firstKeg = input.percentage;
                firstKegWeight = input.weight;
            } else {
                secondKeg = input.percentage;
                secondKegWeight = input.weight;
            }
        }

        function onColored(number, clr) {
            if (number === 0) {
                firstColor = clr;
            } else {
                secondColor = clr;
            }
        }
    }

    visible: true
    width: 800
    height: 480
}
