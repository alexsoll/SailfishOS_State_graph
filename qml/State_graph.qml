import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    property var added: 0
    property var removed: 0
    property var prev: 0

    Connections {
        target: pageStack
        onDepthChanged: {
            check_page_stack()
        }
    }

    function check_page_stack() {
        if (prev > pageStack.depth) {
            removed++;
        } else {
            added++;
        }
        prev = pageStack.depth
    }

    allowedOrientations: defaultAllowedOrientations
}
