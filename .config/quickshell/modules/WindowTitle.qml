import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
    id: root
    implicitHeight: 20

    property string windowTitle: ""

    // titles that wine / other phantom windows produce briefly and which would
    // otherwise flash through the bar — skip the update entirely so the
    // previous real title stays visible.
    readonly property var ignoredTitles: ["Default IME", "MSCTFIME UI"]

    function updateTitle(t) {
        if (!t || t.length === 0) return
        if (root.ignoredTitles.indexOf(t) !== -1) return
        root.windowTitle = t.length > 72 ? t.substring(0, 72) : t
    }

    // Listen for Hyprland activewindow events
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "activewindow") {
                // data format: "class,title"
                var idx = event.data.indexOf(",")
                if (idx !== -1)
                    root.updateTitle(event.data.substring(idx + 1))
            } else if (event.name === "windowtitlev2") {
                // data format: "address,title"
                var idx2 = event.data.indexOf(",")
                if (idx2 !== -1)
                    root.updateTitle(event.data.substring(idx2 + 1))
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
        font.letterSpacing: Theme.letterSpacing
        font.weight: Theme.fontWeight
        antialiasing: Theme.antialiasing
        font.kerning: Theme.kerning
        font.preferShaping: Theme.preferShaping
        renderType: Theme.renderType
    }
}
