import QtQuick 2.7
import QtQuick.Controls 1.4

ApplicationWindow {
    id: root
    visible: true
    width: 700
    height: 300
    title: qsTr("Mars Lander - Map Editor")

    property var dragPointComponent
    property var dragPoints: []

    readonly property int pointCloneIndentation: 100 // How far should we place node clone from original
    readonly property int leftAnchorPointVirtualX: 0
    readonly property int leftAnchorPointVirtualY: 400
    readonly property int middlePointVirtualX: 3500
    readonly property int middlePointVirtualY: 400
    readonly property int rightAnchorPointVirtualX: 6999
    readonly property int rightAnchorPointVirtualY: 400

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem { text: "New Map" }
            MenuItem { text: "Open Existing Map" }
            MenuSeparator { }
            MenuItem { text: "Save Map" }
        }
    }

    MapBackground {
        anchors.fill: parent
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var context2D = canvas.getContext("2d");
            drawLines(context2D)
        }
    }

    Component.onCompleted: {
        dragPointComponent = Qt.createComponent("DragPoint.qml");
        if (dragPointComponent == null) {
            console.log("DragPoint component is not created")
        } else {
            createInitialPoints()
        }
    }

    onWidthChanged: resizeContent()
    onHeightChanged: resizeContent()

    function createInitialPoints() {
        createPoint(0, rightAnchorPointVirtualX, rightAnchorPointVirtualY); // right
        createPoint(0, middlePointVirtualX, middlePointVirtualY); // middle
        createPoint(0, leftAnchorPointVirtualX, leftAnchorPointVirtualY); // left
        dragPoints[0].dragAxis = Drag.YAxis
        dragPoints[0].canCreateOnLeft = false
        dragPoints[2].dragAxis = Drag.YAxis
        dragPoints[2].canCreateOnRight = false
    }

    function createPoint(i, virtualX, virtualY) {
        var point = dragPointComponent.createObject(root);
        if (point == null) {
            console.log("DragPoint object is not created")
        } else {
            // Bind window sizes to drag point properties
            point.windowWidth = Qt.binding(function() { return root.width; })
            point.windowHeight = Qt.binding(function() { return root.height; })
            // Position node on canvas
            point.virtualX = virtualX
            point.virtualY = virtualY
            point.reposition()
            // Request canvas redraw each time node moves
            point.positionChanged.connect(redrawCanvas)
            // Connect clone signal from point to actual function
            point.clone.connect(clonePoint)
            // Insert new node at correct index
            dragPoints.splice(i, 0, point)
        }
        redrawCanvas()
    }

    function clonePoint(side, point) {
        var idx = dragPoints.indexOf(point)
        if (side === "left") {
            createPoint(idx, point.virtualX - pointCloneIndentation, point.virtualY)
        } else if (side === "right") {
            createPoint(idx + 1, point.virtualX + pointCloneIndentation, point.virtualY)
        }
    }

    function resizeContent() {
        // reposition each node
        for (var i = 0; i < dragPoints.length; i++) {
            dragPoints[i].reposition()
        }

        redrawCanvas()
    }

    function redrawCanvas() {
        canvas.requestPaint()
    }

    function drawLines(ctx) {
        // Erase whole canvas
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        // Set line drawing parameters
        ctx.strokeStyle = Qt.rgba(1, 0, 0, 1);
        ctx.lineWidth = 1;
        // Create path of lines going through each node
        ctx.beginPath();
        ctx.moveTo(dragPoints[0].centerX, dragPoints[0].centerY)
        for (var i = 1; i < dragPoints.length; i++) {
            ctx.lineTo(dragPoints[i].centerX, dragPoints[i].centerY)
        }
        // Color fill whole path
        ctx.stroke();
    }
}
