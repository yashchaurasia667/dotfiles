pragma Singleton
import QtQuick

QtObject {
  <* for name, color in colors *>
  readonly property color m3{{name}}: "{{color.default.hex}}"
  <* endfor *>
}
