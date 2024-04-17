import qbs
import QbsUtl
import qbs.FileInfo

QtApplication {

    type: "application"

    consoleApplication: true
    destinationDirectory: "./bin"

    Depends { name: "cpp" }
    Depends { name: "SharedLib" }
    Depends { name: "Yaml" }
    Depends { name: "Qt"; submodules: ["core", "widgets", "quickwidgets", "gui","quick"] }

    cpp.defines: project.cppDefines
    cpp.cxxLanguageVersion: project.cxxLanguageVersion

    // Декларация для подавления Qt warning-ов
    cpp.systemIncludePaths: Qt.core.cpp.includePaths

    Qt.qml.qmlPath: "pages/"

    property pathList qmlImportPaths: ["pages/"]

    files: [
        "actors/ActorController.qml",
        "actors/models/actormodel.cpp",
        "actors/models/actormodel.h",
        "main.cpp",
        "resources.qrc",
        "main.qml",
    ]



}


