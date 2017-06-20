import QtQuick 2.7
import QtQuick.Controls 2.0

Rectangle {
    id: point

    property int centerX: x + point.width / 2
    property int centerY: y + point.height / 2
    property var dragTarget: point
    property var dragAxis: Drag.XAndYAxis

    property bool canCreateOnLeft: true
    property bool canCreateOnRight: true

    signal clone(string side, var point)
    signal remove(var point)
    signal positionChanged(int x, int y)

    width: 10
    height: 10
    radius: 5
    color: "red"

    Drag.active: dragArea.drag.active
    Drag.hotSpot.x: 5
    Drag.hotSpot.y: 5

    onXChanged: positionChanged(x, y)
    onYChanged: positionChanged(x, y)

    Text {
        id: coordinates
        x: 0
        y: -10
        font.pixelSize: 8
        text: Math.round(point.x) + " " + Math.round(point.y)
        color: "white"
    }

    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: dragTarget
        drag.threshold: 1
        drag.axis: dragAxis
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: {
            if (mouse.button == Qt.RightButton) {
                contextMenu.open()
            }
        }
    }

    Menu {
        id: contextMenu

        MenuItem {
            text: "Add node on left"
            enabled: canCreateOnLeft
            onClicked: clone("left", point)
        }

        MenuItem {
            text: "Add node on right"
            enabled: canCreateOnRight
            onClicked: clone("right", point)
        }

        MenuItem {
            text: "Delete node"
            enabled: canCreateOnLeft && canCreateOnRight
            onClicked: remove(point)
        }
    }
}
