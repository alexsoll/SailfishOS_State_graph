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
              Timer {
                  property int i: 1
                  interval: 1000; running: true; repeat: true
                  onTriggered: {
                      if (i % 13 == 1 || i % 13 == 2 || i % 13 == 3) {
                          cross = 1
                          green_light.state = "active"
                      }
                      else if (i % 13 == 4 || i % 13 == 6 || i % 13 == 8) {
                            cross = 1
                            green_light.state = "active"
                      }
                      else {
                          green_light.state = "not_active"
                      }
                      if (i % 13 == 9 || i % 13 == 10) {
                          cross = 0
                          human.state = "Left"
                          yellow_light.state = "active"
                      }
                      else {
                          yellow_light.state = "not_active"
                      }
                      if (i % 13 == 11 || i % 13 == 12 || i % 13 == 0) {
                          red_light.state = "active"
                      }
                      else {
                          red_light.state = "not_active"
                      }
                      i = i + 1
                  }
              }
          }

        Rectangle {
            x: 200
            y: 200
            id: red_light
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: width
            border.color: "black"
            border.width: 1
            radius: width*0.5
            state: "not_active"
            states: [
                State {
                    name: "active"
                    PropertyChanges {
                        target: red_light
                        color: "red"
                    }
                },
                State {
                    name: "not_active"
                    PropertyChanges {
                        target: red_light
                        color: "gray"
                    }
                }
            ]
        }
        Rectangle {
            x: 200
            y: 400
            id: yellow_light
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: width
            border.color: "black"
            border.width: 1
            radius: width*0.5
            state: "not_active"
            states: [
                State {
                    name: "active"
                    PropertyChanges {
                        target: yellow_light
                        color: "yellow"
                    }
                },
                State {
                    name: "not_active"
                    PropertyChanges {
                        target: yellow_light
                        color: "gray"
                    }
                }
            ]
        }
        Rectangle {
            x: 200
            y: 600
            id: green_light
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: width
            border.color: "black"
            border.width: 1
            radius: width*0.5
            state: "active"
            states: [
                State {
                    name: "active"
                    PropertyChanges {
                        target: green_light
                        color: "green"
                    }
                },
                State {
                    name: "not_active"
                    PropertyChanges {
                        target: green_light
                        color: "gray"
                    }
                }
            ]
        }
        Rectangle {
            id: human
            x: 50
            y: 900
            width: 100
            height: width
            border.color: "transparent"
            border.width: 1
            color: "transparent"
            state: "Left"
            Image {
                width: parent.width
                height: parent.height
                source:  "human_1.png"
            }
            states: [
                State {
                    name: "Left"
                    PropertyChanges {
                        target: human
                        x: 50
                        y: 900
                    }
                },
                State {
                    name: "Right"
                    PropertyChanges {
                        target: human
                        x: 600
                        y: 900
                    }
                    when: (cross === 1)
                }
            ]
            transitions: [
                Transition {
                    from: "Left"
                    to: "Right"
                    SequentialAnimation {
                        id: cross_road
                        NumberAnimation {
                            property: "x"
                            from: 50
                            to: 600
                            duration: 3000
                        }
                        NumberAnimation {
                            property: "x"
                            from: 600
                            to: 50
                            duration: 2000
                        }
                        NumberAnimation {
                            property: "x"
                            from: 50
                            to: 600
                            duration: 3000
                        }
                    }
                }
            ]
        }
    }
}

