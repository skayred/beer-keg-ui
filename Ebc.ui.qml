import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.15

GridLayout {
  id: ebcLayout
  width: parent.width
  // y: -1 * parent.height
  // opacity: 0
  columns: 10

  property var ebcs: []
  property int number: 1

  property bool folded: false
  state: !folded ? "shown" : "hidden"

  states: [
    State
    {
      name: "hidden"
      PropertyChanges {
        target: ebcLayout
        opacity: 0
        // visible: false
      }
    },
    State
    {
      name: "shown"
      PropertyChanges {
        target: ebcLayout
        opacity: 1
        // visible: false
      }
    }
  ]

  transitions: [
    Transition {
        from: "shown"
        to: "hidden"

        SequentialAnimation{
            NumberAnimation {
                target: ebcLayout
                property: "opacity"
                duration: 500
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: ebcLayout
                property: "visible"
                duration: 0
            }
        }
    },
    Transition {
        from: "hidden"
        to: "shown"
        SequentialAnimation{
            NumberAnimation {
                target: ebcLayout
                property: "visible"
                duration: 1
            }
            NumberAnimation {
                target: ebcLayout
                property: "opacity"
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
    }
]

  Repeater {
    id: exampleRepeater
    model: ebcs

    Rectangle {
      required property string modelData
      width: 70
      height: 70

      color: modelData
      border.color: 'white'

      MouseArea {
        anchors.fill: parent
        onClicked: () => {
          colorSelected(number, modelData);
          ebc.folded = !ebc.folded
          row.visible = true;
        }
      }
    }
  }
}
