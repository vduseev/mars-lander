import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 700
    height: 300
    title: qsTr("Mars Lander - Map Editor")

    property var dragPointComponent
    property var dragPoints: []



    MapBackground { }

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = canvas.getContext("2d");

            ctx.clearRect(0, 0, canvas.width, canvas.height);
            ctx.strokeStyle = Qt.rgba(1, 0, 0, 1);
            ctx.lineWidth = 1;
            ctx.beginPath();
            ctx.moveTo(dragPoints[0].centerX, dragPoints[0].centerY)

            for (var i = 1; i < dragPoints.length; i++) {
                ctx.lineTo(dragPoints[i].centerX, dragPoints[i].centerY)
            }

            //ctx.closePath();
            ctx.stroke();
        }
    }

    function createPoint(i, x, y) {
        var point = dragPointComponent.createObject(root, { "x": x, "y": y });

        if (point == null) {
            console.log("DragPoint object is not created")
        } else {
            point.positionChanged.connect(redrawCanvas)
            point.clone.connect(clonePoint)
            dragPoints.splice(i, 0, point)
        }
    }

    function clonePoint(side, point) {
        var idx = dragPoints.indexOf(point)
        if (side === "left") {
            createPoint(idx, point.x - 20, point.y)
        } else if (side === "right") {
            createPoint(idx + 1, point.x + 20, point.y)
        }
        canvas.requestPaint()
    }

    Component.onCompleted: {
        dragPointComponent = Qt.createComponent("DragPoint.qml");

        if (dragPointComponent == null) {
            console.log("DragPoint component is not created")
        } else {
            createPoint(0, 695, 200); // right
            createPoint(0, 345, 200); // middle
            createPoint(0, -5, 200); // left
            dragPoints[0].dragTarget = null
            dragPoints[0].canCreateOnLeft = false
            dragPoints[2].dragTarget = null
            dragPoints[2].canCreateOnRight = false
        }
    }

    function redrawCanvas() {
        canvas.requestPaint()
    }
}
