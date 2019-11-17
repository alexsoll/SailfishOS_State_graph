import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property string hr: "0"
    property string min: "0"
    property string sec: "0"
    Row {
        property int pntSize: 50
        Label {
            font.pixelSize: 50
            text: hr
        }
        Label {
            font.pixelSize: 50
            text: " : "
        }

        Label {
            font.pixelSize: 50
            text: min
        }
        Label {
            font.pixelSize: 50
            text: " : "
        }

        Label {
            font.pixelSize: 50
            text: sec
        }
    }
}
