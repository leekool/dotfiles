import QtQuick
import Quickshell.Io

Item {
    id: root
    implicitHeight: Theme.barHeight
    implicitWidth: label.implicitWidth + Theme.modulePadding

    Timer {
        interval: 5000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: netProc.running = true
    }

    Process {
        id: netProc
        // get the interface used for default route, if any
        command: ["sh", "-c",
            "ip route get 1.1.1.1 2>/dev/null | awk '/dev/{for(i=1;i<=NF;i++) if($i==\"dev\") print $(i+1); exit}'"
        ]
        stdout: StdioCollector {
            onStreamFinished: {
                var iface = text.trim()
                if (iface.length === 0) {
                    label.text  = "󰖪 down"
                    label.color = "#FC5C65"
                } else if (iface.startsWith("w")) {
                    label.text  = "󰖩 " + iface
                    label.color = Theme.fg
                } else {
                    label.text  = "󰈀 " + iface
                    label.color = Theme.fg
                }
            }
        }
    }

    Text {
        id: label
        anchors.centerIn: parent
        height: Theme.barHeight
        verticalAlignment: Text.AlignVCenter
        text: "󰖩 …"
        color: Theme.fg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.letterSpacing: Theme.letterSpacing
        antialiasing: Theme.antialiasing
    }
}
