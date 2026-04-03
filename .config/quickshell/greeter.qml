import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Greetd
import "modules"

ShellRoot {
    id: root

    property string resolvedUser: ""

    // Find first real user (UID >= 1000)
    Process {
        id: userPoller
        command: ["bash", "-c", "awk -F: '$3 >= 1000 && $3 < 65534 {print $1; exit}' /etc/passwd"]
        stdout: StdioCollector {
            onStreamFinished: {
                let name = this.text.trim()
                root.resolvedUser = (name !== "") ? name : "user"
                Greetd.createSession(root.resolvedUser)
            }
        }
        Component.onCompleted: running = true
    }

    Connections {
        target: Greetd

        function onAuthMessage(message, error, responseRequired, echoResponse) {
            ui.authStatusText = "Locked"
        }

        function onReadyToLaunch() {
            Greetd.launch(["start-hyprland"], ["XDG_SESSION_TYPE=wayland", "XDG_CURRENT_DESKTOP=Hyprland"], true)
        }

        function onAuthFailure(message) {
            ui.authFailed = true
            ui.authAuthenticating = false
            ui.authStatusText = "Access Denied"
            Greetd.cancelSession()
            Greetd.createSession(root.resolvedUser)
        }
    }

    Process { id: suspendProcess; command: ["systemctl", "suspend"] }
    Process { id: poweroffProcess; command: ["systemctl", "poweroff"] }
    Process { id: rebootProcess;  command: ["systemctl", "reboot"] }

    FloatingWindow {
        id: win
        visible: true
        width: screen ? screen.width : 1920
        height: screen ? screen.height : 1080

        LockUI {
            id: ui
            anchors.fill: parent
            username: root.resolvedUser

            onPasswordSubmitted: (pw) => { Greetd.respond(pw) }
            onPowerAction: (action) => {
                if (action === "suspend")       suspendProcess.running = true
                else if (action === "reboot")   rebootProcess.running = true
                else if (action === "poweroff") poweroffProcess.running = true
            }
        }
    }
}
