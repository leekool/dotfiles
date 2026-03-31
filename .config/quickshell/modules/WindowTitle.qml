import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
    id: root
    implicitHeight: 20

    property string windowTitle: ""

    // Listen for Hyprland activewindow events
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "activewindow") {
                // data format: "class,title"
                var idx = event.data.indexOf(",")
                if (idx !== -1) {
                    var t = event.data.substring(idx + 1)
                    root.windowTitle = t.length > 72 ? t.substring(0, 72) : t
                }
            } else if (event.name === "windowtitlev2") {
                // data format: "address,title"
                var idx2 = event.data.indexOf(",")
                if (idx2 !== -1) {
                    var t2 = event.data.substring(idx2 + 1)
                    root.windowTitle = t2.length > 72 ? t2.substring(0, 72) : t2
                }
            }
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 7
        text: root.windowTitle
        color: Theme.fgActive
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.weight: Theme.fontWeight
        antialiasing: Theme.antialiasing
        font.kerning: Theme.kerning
        font.preferShaping: Theme.preferShaping
        renderType: Theme.renderType
    }
}
