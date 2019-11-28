import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    default property var txt
    property color clr: "white"
    Button {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: txt.text
        color: clr
    }
}
