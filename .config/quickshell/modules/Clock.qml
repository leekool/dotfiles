import QtQuick

Item {
    id: root
    implicitHeight: Theme.barHeight
    implicitWidth: label.implicitWidth + Theme.modulePadding / 2

    function formatted() {
        return " " + Qt.formatDateTime(new Date(), "ddd dd MMM  hh:mm")
    }

    Timer {
        interval: 10000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: label.text = root.formatted()
    }

    Text {
        id: label
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        height: Theme.barHeight
        verticalAlignment: Text.AlignVCenter
        text: root.formatted()
        color: Theme.fg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        antialiasing: Theme.antialiasing
    }
}
