import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    Item {
        id: item
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        Rectangle {
            //anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            DefaultBtn {
                clr: "red"
                Text {
                    id: txt
                    text: qsTr("Hello")
                }
            }

        }
    }
}
