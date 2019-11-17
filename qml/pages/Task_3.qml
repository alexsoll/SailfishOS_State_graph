import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int cross: 0
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
        }

        // Tell SilicaFlickable the height of its content.

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Item {
            Button {
                            id: button1
                            text: "Button"
                            onPressed: hello.state = "fallen"
                            onReleased: hello.state = ""
                        }
            Text {
                font.pointSize: 50
                id: hello
                text: qsTr("Hello World!")
                //color: "red"
                height: 200
                width: 400
                y: 150
                x: 200
                anchors.verticalCenter: parent.Center
                states: [
                    State {
                            name: "fallen"
                            PropertyChanges {
                                target: hello
                                y: 1000
                                rotation: 180
                            }

                        }
                ]
                transitions: [
                    Transition {
                            NumberAnimation {
                                targets: [hello]
                                properties: "y"
                                duration: 2000
                            }
                            RotationAnimation {
                                direction: RotationAnimation.Counterclockwise
                                duration: 2000
                            }
                            ColorAnimation {
                                id: colorAnimIn
                                from: "red"
                                to: "green"
                                duration: 1500
                                target: hello
                                property: 'color'
                            }
                    }
                ]
            }
        }
    }
}

