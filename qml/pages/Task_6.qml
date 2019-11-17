import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            MenuItem {
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("Task_3.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            property var hr: 0
            property var min: 0
            property var sec: 0
            Button {
                x: 200
                y: 400
                text: "Start/stop"
                onClicked: timer.running = !timer.running
            }
            Timer {
                id: timer
                interval: 1000; running: false; repeat: true
                onTriggered: {
                    column.sec = column.sec + 1
                    if (column.sec == 60) {
                        column.sec = 0
                        column.min = column.min + 1
                    }
                    if (column.min == 60) {
                        column.min = 0
                        column.hr = column.hr + 1
                    }
                }
            }
            MyTimer {
                x : 300
                y : 400
                hr: column.hr
                min: column.min
                sec: column.sec
            }
        }
    }
}

