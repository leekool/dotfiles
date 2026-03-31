import QtQuick
import Quickshell.Io

Item {
    id: root
    implicitHeight: Theme.barHeight
    implicitWidth: Theme.modulePadding + iconText.implicitWidth + 4 + numMetrics.width

    property string displayPct:  "…"
    property string displayIcon: "󰕾"

    TextMetrics {
        id: numMetrics
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        text: "100%"
    }

    function icon(pct, muted) {
        if (muted || pct === 0) return "󰖁"
        if (pct < 40)           return "󰕿"
        if (pct < 70)           return "󰖀"
        return "󰕾"
    }

    function fetch() { volProc.running = true }

    Timer {
        interval: 2000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: root.fetch()
    }

    Process {
        id: volProc
        command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
        stdout: StdioCollector {
            onStreamFinished: {
                var line  = text.trim()
                var muted = line.indexOf("MUTED") !== -1
                var match = line.match(/[\d.]+/)
                if (match) {
                    var pct = Math.round(parseFloat(match[0]) * 100)
                    root.displayIcon = root.icon(pct, muted)
                    root.displayPct  = pct + "%"
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse) => {
            var cmd = mouse.button === Qt.LeftButton
                ? "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                : "pavucontrol"
            muteProc.command = ["sh", "-c", cmd]
            muteProc.running = true
        }
        onWheel: (wheel) => {
            var cmd = wheel.angleDelta.y > 0
                ? "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                : "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            muteProc.command = ["sh", "-c", cmd]
            muteProc.running = true
        }
    }

    Process {
        id: muteProc
        onRunningChanged: if (!running) root.fetch()
    }

    Text {
        id: iconText
        anchors.left: parent.left
        anchors.leftMargin: Theme.modulePadding / 2
        anchors.verticalCenter: parent.verticalCenter
        text: root.displayIcon
        color: Theme.fg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
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
        antialiasing: Theme.antialiasing
    }
}
