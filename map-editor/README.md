# Mars Lander Map Editor

This is a basic map editor written using Qt QML.
It allows you to design maps using simple drag and drop.

Editing process:
![Map editor in action](https://image.ibb.co/eDG2TQ/map_editing.png)

Initial map:
![Initial map](https://image.ibb.co/jyzNTQ/initial_map.png)

## Usage

Sorry, no info here yet.

## Requirements

1. New map is initiated with 3 points: one in the middle and to anchor points.
1. Nodes can be dragged at any direction by grabbing them, as in usual drag operation.
1. The most left and the most right nodes (anchor nodes) can only be dragged
   along Y axis.
1. Each node has a context menu which opens when user right clicks the node.
  - "Create node on the left". Creates node on the left side of current node
    with 20px basic indentation. Not enabled for left anchor node.
  - "Create node on the right". Creates node on the right side of current node
    with 20px basic indentation. Not enabled for right anchor node.
  - "Delete node". Removes current node. Not available for anchor nodes.
1. Whole content of map-editor is scalable if window is resized.

## Architecture

### Basic ideas
* Nodes (drag points) are implemented as QML Items with drag functionality.
* Lines are painted on QML canvas.

### Content resizing
* Scale factor is calculated for width and height.
* Each node has a virtual position.
* When user drags a node its virtual position is recalculated.
* When user resizes window then node's virtual position is used to calculate
  actual X and Y.
