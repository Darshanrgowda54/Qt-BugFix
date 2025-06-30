import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 400
    height: 300
    title: "Drag and Drop Example"

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#f0f0f0"

        Rectangle {
            id: draggable
            width: 80
            height: 80
            color: "skyblue"
            radius: 10
            x: 20
            y: 20

            Drag.active: dragArea.drag.active
            Drag.hotSpot.x: dragArea.mouseX
            Drag.hotSpot.y: dragArea.mouseY
            Drag.source: draggable

            MouseArea {
                id: dragArea
                anchors.fill: parent
                drag.target: parent
                onReleased: {

                    if (!draggable.Drag.drop()) {
                        draggable.x = 20
                        draggable.y = 20
                    }
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Drag me"
                font.bold: true
            }
        }

        Rectangle {
            id: dropTarget
            width: 100
            height: 100
            color: dragArea.containsDrag ? "#d0ffd0" : "#dddddd"
            radius: 10
            anchors.right: parent.right
            anchors.rightMargin: 30
            anchors.verticalCenter: parent.verticalCenter

            Text {
                anchors.centerIn: parent
                text: "Drop here"
                font.bold: true
            }

            DropArea {
                anchors.fill: parent
                onDropped: {
                    draggable.x = dropTarget.x + (dropTarget.width - draggable.width) / 2
                    draggable.y = dropTarget.y + (dropTarget.height - draggable.height) / 2

                    console.log(" Drag drop source: ", drop.source)
                    //console.log(" Drag drop source: ", drop.drag.source)
                }
            }
        }
    }
}




