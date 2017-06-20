import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: 700
    height: 300
    title: qsTr("Mars Lander - Map Editor")

    Rectangle {
        id: background
        color: "black"
        anchors.fill: parent
    }

    Rectangle {
        id: point
        width: 10
        height: 10
        radius: 5
        color: "transparent"

        border.color: "red"
        border.width: 2

        x: 350
        y: 150

        Drag.active: dragArea.drag.active
        Drag.hotSpot.x: 5
        Drag.hotSpot.y: 5

        MouseArea {
            id: dragArea
            anchors.fill: parent
            drag.target: parent
            drag.threshold: 1
        }
    }
}
