<h1 align='center'>ESX Dialog</a></h1><p align='center'><b>
![Imgur](https://imgur.com/ZuChElL.png)

---
## Description  (**Fully Standalone**)
It's little ui to open a dialog box and ask the player to confirm or cancel the action.</br>

### Usage :
- Only from client side with exports.</br>
- Support icon from font awesome or bootsrap.</br>

Arguments (send all data in a table):
* **icon**: string | Dialog title icon (can be set to nil or '' if you don't want an icon in your title).
* **title**: string | Dialog title.
* **content**: string | Dialog message.

Example:
```lua
    local options = {
        icon = 'fas fa-car',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?'
    }

    local accepted = exports['esx_dialog']:CreateDialog(options)

    if accepted then
        exports["esx_notify"]:Notify("info", 3000, "You are now the owner of this Benefactor Schafter V12 !")
    else
        exports["esx_notify"]:Notify("info", 3000, "Too bad it will be for another time, have a nice day !")
    end
```
