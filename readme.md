<h1 align='center'>ESX Dialog</a></h1><p align='center'><b>


---
## Description  (**Fully Standalone**)
It's little ui to open a dialog box and ask the player to confirm or cancel the action (is asynchronous).</br>
</br>
![Imgur](https://imgur.com/ZuChElL.png)

### Usage :
- Only from client side with exports.</br>
- Support icon from font awesome or bootsrap.</br>
- call with an exports.</br>
- If several scripts send a modal, they will each appear in turn.</br>

Arguments (send all data in a table):
* **icon**: string | Dialog title icon (can be set to nil or '' if you don't want an icon in your title).
* **title**: string | Dialog title.
* **content**: string | Dialog message.
* **delay**: number | Delay to the dialog goes is automatically canceled.

Example:
```lua
    local options = {
        icon = 'fas fa-car',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?',
        delay = 5000, -- Currently not used.
    }

    local accepted = exports['esx_dialog']:CreateDialog(options)

    if accepted then
        exports["esx_notify"]:Notify("info", 3000, "You are now the owner of this Benefactor Schafter V12 !")
    else
        exports["esx_notify"]:Notify("info", 3000, "Too bad it will be for another time, have a nice day !")
    end
```

## To do:

- Make ui responsive.
- Cancel the modal if the player does not respond (define the delay via parameter).
- Maybe add a little sound when the modal fade in.
- Add option to change all colors without open the css file.
