import QtQuick 2.7

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
