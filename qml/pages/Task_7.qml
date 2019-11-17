import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    property var added: 0
    property var removed: 0
    property var prev: 0

    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: parent.width
            Connections {
                target: pageStack
                onDepthChanged: {
                    if (page.prev > pageStack.depth) {
                        page.removed = page.removed + 1
                    } else {
                        page.added = page.added + 1
                    }
                    page.prev = pageStack.depth
                }
            }

            spacing: Theme.paddingLarge
            Button {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Add page"
                onClicked: pageStack.push(Qt.resolvedUrl("Task_6.qml"))
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Remove page"
                onClicked: pageStack.popAttached()
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Added : " + page.added
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Remove : " + page.removed
            }
        }
    }
}
