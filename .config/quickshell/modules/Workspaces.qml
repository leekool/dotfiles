import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

RowLayout {
    spacing: 0

    Repeater {
        model: [1, 2, 3, 4]

        Rectangle {
            required property int modelData
            property int wsId: modelData
            property bool isActive: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === wsId
            property bool hovered: false
            property var wsObject: {
                for (let i = 0; i < Hyprland.workspaces.count; i++) {
                    const ws = Hyprland.workspaces.get(i);
                    if (ws.id === wsId) return ws;
                }
                return null;
            }
            property bool hasWindows: wsObject !== null && wsObject.windowCount > 0

            Layout.preferredWidth: 24
            height: 20
            color: hovered ? Theme.hoverBg : Theme.bg

            Text {
                anchors.centerIn: parent
                text: isActive || hasWindows ? "●" : "○"
                color: isActive ? Theme.fgActive : hasWindows ? Theme.fg : "#444455"
                font.family: Theme.fontFamily
                font.pixelSize: 10
                antialiasing: Theme.antialiasing
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: Hyprland.dispatch("workspace " + wsId)
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
            }
        }
    }
}
