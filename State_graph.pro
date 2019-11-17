# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = State_graph

CONFIG += sailfishapp

SOURCES += src/State_graph.cpp

DISTFILES += qml/State_graph.qml \
    qml/cover/CoverPage.qml \
    qml/pages/DefaultBtn.qml \
    qml/pages/FirstPage.qml \
    qml/pages/Lights.qml \
    qml/pages/MyTimer.qml \
    qml/pages/SecondPage.qml \
    qml/pages/Task_3.qml \
    qml/pages/Task_4.qml \
    qml/pages/Task_5.qml \
    qml/pages/Task_6.qml \
    qml/pages/Task_7.qml \
    rpm/State_graph.changes.in \
    rpm/State_graph.changes.run.in \
    rpm/State_graph.spec \
    rpm/State_graph.yaml \
    translations/*.ts \
    State_graph.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/State_graph-de.ts
