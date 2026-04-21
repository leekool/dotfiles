import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "modules"

ShellRoot {
    Notifications {}

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: Theme.barHeight
            color: Theme.bg

            Rectangle {
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                height: 1
                color: Theme.separator
            }

            // Left: window title
            WindowTitle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: centerWorkspaces.left
            }

            // Center: workspaces — dead centre
            Workspaces {
                id: centerWorkspaces
                anchors.centerIn: parent
            }

            // Right: status modules
            RowLayout {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                spacing: 0

                Tray {}
                Internet {}
                Volume { screen: modelData }
                Memory {}
                Cpu {}
                Clock {}
            }
        }
    }
}
