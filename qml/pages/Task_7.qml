import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height
        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: parent.width

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
                text: "Added : " + added
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter;
                text: "Remove : " + removed
            }
        }
    }
}
