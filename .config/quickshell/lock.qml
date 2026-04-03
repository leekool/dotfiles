import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Pam
import "modules"

ShellRoot {
    id: root

    PamContext {
        id: pam
        config: "quickshell"
        Component.onCompleted: pam.start()
        onCompleted: (result) => {
            ui.authAuthenticating = false
            if (result === PamResult.Success) {
                rootLock.locked = false
                Qt.quit()
            } else {
                ui.authFailed = true
                ui.authStatusText = "Access Denied"
                pam.start()
            }
        }
    }

    Process { id: suspendProcess; command: ["systemctl", "suspend"] }
    Process { id: poweroffProcess; command: ["systemctl", "poweroff"] }
    Process { id: rebootProcess;  command: ["systemctl", "reboot"] }

    WlSessionLock {
        id: rootLock
        locked: true

        WlSessionLockSurface {
            LockUI {
                id: ui
                anchors.fill: parent

                onPasswordSubmitted: (pw) => { pam.respond(pw) }
                onPowerAction: (action) => {
                    if (action === "suspend")  suspendProcess.running = true
                    else if (action === "reboot")   rebootProcess.running = true
                    else if (action === "poweroff")  poweroffProcess.running = true
                }
            }

            // Wallpaper path
            Process {
                command: ["bash", "-c", "awww query 2>/dev/null | grep -oP 'image: \\K[^,]+' | head -n1"]
                stdout: StdioCollector {
                    onStreamFinished: {
                        let path = this.text.trim()
                        if (path !== "")
                            ui.wallpaperPath = path.startsWith("file://") ? path : "file://" + path
                    }
                }
                Component.onCompleted: running = true
            }

            // Username
            Process {
                command: ["bash", "-c", "getent passwd $USER | cut -d: -f5 | cut -d, -f1 || echo $USER"]
                stdout: StdioCollector {
                    onStreamFinished: {
                        let name = this.text.trim()
                        if (name !== "") ui.username = name
                    }
                }
                Component.onCompleted: running = true
            }
        }
    }
}
