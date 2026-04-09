import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

RowLayout {
    spacing: 0

    Repeater {
        model: [1, 2, 3, 4, 5, 6]

        Rectangle {
            required property int modelData
            property int wsId: modelData
            property bool isActive: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === wsId
            property bool hovered: false

            Layout.preferredWidth: wsLabel.implicitWidth + 6
            height: 20
            color: isActive ? Theme.activeBg : hovered ? Theme.hoverBg : Theme.bg

            Rectangle {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: 2
                color: isActive ? Theme.border : "transparent"
            }

            Text {
                id: wsLabel
                anchors.centerIn: parent
                text: ["I", "II", "III", "IV", "V", "VI"][wsId - 1]
                color: isActive ? Theme.fgActive : Theme.fg
                font.family: Theme.fontFamily
                font.pixelSize: Theme.fontSize
                font.letterSpacing: Theme.letterSpacing
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
