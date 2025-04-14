import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import Battery from 'resource:///com/github/Aylur/ags/service/battery.js';
import Avatar from '../../misc/avatar.js';
import icons from '../../icons.js';
import { openSettings } from '../../settings/theme.js';
import { uptime } from '../../variables.js';

export default () => Widget.Box({
    class_name: 'header horizontal',
    children: [
        Avatar(),
        Widget.Box({
            hpack: 'end',
            vpack: 'center',
            hexpand: true,
            children: [
                Widget.Box({
                    class_name: 'battery horizontal',
                    children: [
                        Widget.Icon({ icon: Battery.bind('icon_name') }),
                        Widget.Label({ label: Battery.bind('percent').transform(p => `${p}%`) }),
                    ],
                }),
                Widget.Label({
                    class_name: 'uptime',
                    label: uptime.bind().transform(v => `up: ${v}`),
                }),
                Widget.Button({
                    on_clicked: openSettings,
                    child: Widget.Icon(icons.ui.settings),
                }),
            ],
        }),
    ],
});
