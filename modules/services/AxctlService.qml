pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var focusedMonitor: null
    property var focusedWorkspace: null
    property var focusedClient: null

    property QtObject clients: QtObject {
        property var values: []
    }

    property QtObject monitors: QtObject {
        property var values: []
    }

    property QtObject workspaces: QtObject {
        property var values: []
    }

    signal rawEvent(var event)

    function dispatch(command) {
        // To be implemented in Task 3
    }

    function monitorFor(screen) {
        // To be implemented in Task 3
        return null
    }

    property Process axctlProcess: Process {
        command: ["axctl", "daemon"]
        running: true
        stdout: SplitParser {
            onRead: (data) => {
                // JSON-RPC parsing to be implemented in Task 2
            }
        }
        onExited: (code) => {
            console.warn("axctl daemon exited with code:", code)
        }
    }
    
    Component.onDestruction: {
        axctlProcess.running = false
    }
}
