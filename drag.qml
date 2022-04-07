import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import QtQuick.Window 2.2
Window {
    title: qsTr("Test Crop")
    width: 640
    height: 480
    visible: true
/*     Component.onCompleted: ensureValidWindowPosition()
    Component.onDestruction: saveScreenLayout() */

    Settings {
        property alias x: selComp.x
        property alias y: selComp.y
        property alias width: selComp.width
        property alias height: selComp.height
    }
/* 
    function saveScreenLayout() {
        settings.desktopAvailableWidth = Screen.desktopAvailableWidth
        settings.desktopAvailableHeight = Screen.desktopAvailableHeight
    }

    function ensureValidWindowPosition() {
        var savedScreenLayout = (settings.desktopAvailableWidth === Screen.desktopAvailableWidth)
                && (settings.desktopAvailableHeight === Screen.desktopAvailableHeight)
        image1.x = (savedScreenLayout) ? settings.x : Screen.width / 2 - image1.width / 2
        image1.y = (savedScreenLayout) ? settings.y : Screen.height / 2 - image1.height / 2
    } */

    Rectangle {
        id: image1
        anchors.fill: parent
        color: "lightgrey"
        Rectangle {
            id: selComp
            border {
                width: 2
                color: "steelblue"
            }
            color: "#354682B4"
            Rectangle {
                width: 18
                height: 18
                color: "steelblue"
                anchors.verticalCenter:parent.top
                anchors.horizontalCenter: parent.left
                MouseArea {
                    
                    anchors.fill: parent
                    drag{ target: parent; axis: Drag.XAndYAxis }
                    onPositionChanged: {
                        if(drag.active){
                            var delta = Math.max(mouseX, mouseY)
                            var newWidth = selComp.width - delta
                            var newHeight = selComp.height - delta;

                            if (newWidth < width || newHeight < height)
                                return

                            selComp.width = newWidth
                            selComp.x = selComp.x + delta

                            selComp.height = newHeight
                            selComp.y = selComp.y + delta
                        }
                    }
                }
            }
        }
    }
} 