import QtQuick
import Quickshell.Io

Item {
    id: root
    implicitHeight: Theme.barHeight
    implicitWidth: Theme.modulePadding + iconText.implicitWidth + 4 + numMetrics.width

    property string displayPct: "…"

    TextMetrics {
        id: numMetrics
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.letterSpacing: Theme.letterSpacing
        text: "100%"
    }

    Timer {
        interval: 10000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: memProc.running = true
    }

    Process {
        id: memProc
        command: ["sh", "-c",
            "awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{printf \"%d%%\", int((t-a)/t*100)}' /proc/meminfo"
        ]
        stdout: StdioCollector {
            onStreamFinished: {
                var t = text.trim()
                if (t.length > 0) root.displayPct = t
            }
        }
    }

    Text {
        id: iconText
        anchors.left: parent.left
        anchors.leftMargin: Theme.modulePadding / 2
        anchors.verticalCenter: parent.verticalCenter
        text: "󰘚"
        color: Theme.fg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.letterSpacing: Theme.letterSpacing
        antialiasing: Theme.antialiasing
    }

    Text {
        anchors.left: iconText.right
        anchors.leftMargin: 4
        anchors.verticalCenter: parent.verticalCenter
        width: numMetrics.width
        text: root.displayPct
        color: Theme.fg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.letterSpacing: Theme.letterSpacing
        antialiasing: Theme.antialiasing
    }
}
