import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0

Rectangle {
    id: point

    property var dragTarget: point
    property var dragAxis: Drag.XAndYAxis

    property int basePointSizePx: 11 // required for width and height scaling of drag point

    property int windowWidth // binded to parent window size
    property int windowHeight // binded to parent window size
    property int windowBaseWidth: 700 // required only for window scaling calculation
    property int windowBaseHeight: 300 // required only for window scaling calculation
    property real widthScaleFactor: windowWidth / windowBaseWidth
    property real heightScaleFactor: windowHeight / windowBaseHeight

    property int virtualMapWidth: 6999
    property int virtualMapHeight: 2999
    property int virtualX // assigned during creating, then recalculated during dragging
    property int virtualY // assigned during creating, then recalculated during dragging

    property int centerX: 0 // required for canvas line drawing. calculated with reposition() function
    property int centerY: 0 // required for canvas line drawing. calculated with reposition() function

    property bool canCreateOnLeft: true
    property bool canCreateOnRight: true

    signal clone(string side, var point)
    signal remove(var point)
    signal positionChanged(int x, int y)

    width: basePointSizePx * widthScaleFactor
    height: basePointSizePx * heightScaleFactor
    //radius: 5
    color: "transparent"
    border { width: 1; color: "red" }

    Drag.active: dragArea.drag.active
    Drag.hotSpot.x: width / 2
    Drag.hotSpot.y: height / 2

    onXChanged: {
        if (x < coordinates.contentWidth) {
            coordinates.x = width
        } else if (x > windowWidth - coordinates.contentWidth) {
            coordinates.x = -coordinates.contentWidth
        } else {
            coordinates.x = -coordinates.contentWidth / 2
        }

        if (dragArea.drag.active) {
            recalculateVirtualPosition()
        }

        positionChanged(x, y);
    }

    onYChanged: {
        if (dragArea.drag.active) {
            recalculateVirtualPosition()
        }

        positionChanged(x, y);
    }

    Text {
        id: coordinates
        y: -height * 1.1
        font.pixelSize: 8 * (heightScaleFactor + widthScaleFactor) / 2
        text: "(" + Math.round(virtualX) + "; " + Math.round(virtualY) + ")"
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

    function reposition() {
        centerX = virtualX / virtualMapWidth * windowWidth
        // different because virtualY is inverted regarding to actual Y
        centerY = (1 - virtualY / virtualMapHeight) * windowHeight
        // calculate actual drawing potision
        point.x = centerX - point.width / 2
        point.y = centerY - point.height / 2
    }

    function recalculateVirtualPosition() {
        centerX = point.x + point.width / 2
        centerY = point.y + point.height / 2
        // convert to virtual coordinates
        virtualX = centerX / windowWidth * virtualMapWidth
        virtualY = (1 - centerY / windowHeight) * virtualMapHeight
    }
}
