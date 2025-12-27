import QtQuick 2.15
import QtQuick.Controls 2.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height

    // Background wallpaper
    Image {
        id: background
        anchors.fill: parent
        source: wallpaper
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        cache: true

        // Blur effect on login
        opacity: loginAnimation.running ? 0.7 : 1.0
        Behavior on opacity {
            NumberAnimation { duration: 600 }
        }
    }

    // Glitch animation overlay
    Rectangle {
        id: glitchOverlay
        anchors.fill: parent
        color: "transparent"
        opacity: 0

        // Random glitch bars
        Repeater {
            model: 5
            Rectangle {
                width: parent.width
                height: 2
                color: primaryColor
                opacity: 0.3
                y: Math.random() * parent.height

                SequentialAnimation on y {
                    running: loginAnimation.running
                    loops: Animation.Infinite
                    NumberAnimation {
                        to: parent.height
                        duration: 200 + Math.random() * 300
                    }
                    PropertyAction { value: 0 }
                }
            }
        }
    }

    // Main login container
    Item {
        id: loginContainer
        anchors.centerIn: parent
        width: 400
        height: 300

        // Scale animation
        scale: 1.0
        Behavior on scale {
            NumberAnimation { duration: 400; easing.type: Easing.OutBack }
        }

        Component.onCompleted: {
            scale = 0.8
            scale = 1.0
        }

        Column {
            anchors.centerIn: parent
            spacing: 30

            // Username field
            Rectangle {
                width: 400
                height: 60
                color: "transparent"
                border.color: primaryColor
                border.width: 2
                radius: 0

                // Glow effect
                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.color: primaryColor
                    border.width: 1
                    radius: 0
                    opacity: 0.3
                    scale: 1.05
                }

                TextBox {
                    id: usernameField
                    anchors.fill: parent
                    anchors.margins: 10
                    font.family: fontFamily
                    font.pixelSize: 18
                    color: secondaryColor
                    placeholderText: "USERNAME"
                    text: userModel.lastUser

                    background: Rectangle {
                        color: "transparent"
                    }

                    KeyNavigation.tab: passwordField
                    Keys.onReturnPressed: sddm.login(usernameField.text, passwordField.text, sessionIndex)
                }
            }

            // Password field
            Rectangle {
                width: 400
                height: 60
                color: "transparent"
                border.color: primaryColor
                border.width: 2
                radius: 0

                // Glow effect
                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.color: primaryColor
                    border.width: 1
                    radius: 0
                    opacity: 0.3
                    scale: 1.05
                }

                PasswordBox {
                    id: passwordField
                    anchors.fill: parent
                    anchors.margins: 10
                    font.family: fontFamily
                    font.pixelSize: 18
                    color: secondaryColor
                    placeholderText: "PASSWORD"
                    focus: true

                    background: Rectangle {
                        color: "transparent"
                    }

                    KeyNavigation.tab: usernameField
                    Keys.onReturnPressed: sddm.login(usernameField.text, passwordField.text, sessionIndex)

                    onTextChanged: {
                        if (loginFailed) {
                            loginFailed = false
                            failedAnimation.stop()
                        }
                    }
                }
            }
        }
    }

    // Login failed shake animation
    property bool loginFailed: false

    SequentialAnimation {
        id: failedAnimation
        NumberAnimation { target: loginContainer; property: "x"; to: loginContainer.x + 20; duration: 50 }
        NumberAnimation { target: loginContainer; property: "x"; to: loginContainer.x - 20; duration: 50 }
        NumberAnimation { target: loginContainer; property: "x"; to: loginContainer.x + 20; duration: 50 }
        NumberAnimation { target: loginContainer; property: "x"; to: loginContainer.x - 20; duration: 50 }
        NumberAnimation { target: loginContainer; property: "x"; to: loginContainer.x; duration: 50 }
    }

    // Success login animation
    SequentialAnimation {
        id: loginAnimation

        ParallelAnimation {
            NumberAnimation {
                target: loginContainer
                property: "opacity"
                to: 0
                duration: 400
            }
            NumberAnimation {
                target: loginContainer
                property: "scale"
                to: 1.2
                duration: 400
                easing.type: Easing.InBack
            }
        }

        PropertyAnimation {
            target: glitchOverlay
            property: "opacity"
            to: 1.0
            duration: 600
        }

        ScriptAction {
            script: {
                // Fade to black
                background.opacity = 0
            }
        }
    }

    // Error message
    Text {
        id: errorMessage
        anchors.top: loginContainer.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: "ACCESS DENIED"
        font.family: fontFamily
        font.pixelSize: 16
        font.bold: true
        color: errorColor
        opacity: loginFailed ? 1.0 : 0.0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

    // Time and date display
    Column {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 40
        spacing: 5

        Text {
            id: timeText
            text: Qt.formatTime(timeSource.currentDateTime, "hh:mm:ss")
            font.family: fontFamily
            font.pixelSize: 48
            font.bold: true
            color: secondaryColor
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: dateText
            text: Qt.formatDate(timeSource.currentDateTime, "dddd, MMMM d, yyyy")
            font.family: fontFamily
            font.pixelSize: 16
            color: secondaryColor
            opacity: 0.7
            horizontalAlignment: Text.AlignRight
        }
    }

    // System info
    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 40
        text: "MIKOSHI // AKASARA"
        font.family: fontFamily
        font.pixelSize: 14
        font.bold: true
        color: primaryColor
        opacity: 0.7
    }

    // Timer for clock
    Timer {
        id: timeSource
        interval: 1000
        repeat: true
        running: true
        property var currentDateTime: new Date()
        onTriggered: currentDateTime = new Date()
    }

    // Properties from theme.conf
    property string wallpaper: config.background
    property string primaryColor: config.primaryColor
    property string secondaryColor: config.secondaryColor
    property string errorColor: config.errorColor
    property string fontFamily: config.fontFamily
    property int sessionIndex: sessionModel.lastIndex

    // Connection to SDDM
    Connections {
        target: sddm
        function onLoginFailed() {
            loginFailed = true
            failedAnimation.start()
        }

        function onLoginSucceeded() {
            loginAnimation.start()
        }
    }
}
