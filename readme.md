<h1 align='center'>ESX Dialog</a></h1><p align='center'><b>
<p align="center">Description  (**Fully Standalone**)</p>
<p align="center">It's little ui to open a dialog box and ask the player to confirm or cancel the action (is asynchronous).</p></br>
<p align="center">Be indulgent this is my first resource including lua, html, css, js and jQuery (I'm currently studying them).</p></br>
<p align="center"><img src="https://imgur.com/ZuChElL.png"></p>

---
### Usage :
- Only from client side with exports.</br>
- Support icon from Font Awesome v6.1.1 or bootstrap.</br>
- Call it with an exports from any scripts.</br>
- If several scripts send a modal, they will each appear in turn.</br>

### Config (example):
- Choose if you want use a custom color for an element (border, background and text color).
- Set the value of your custom color (use css syntax).

```lua
Config.Sound = {
    play = true, -- true or false | if true a sound will be played on modal fadIn.
    volume = 0.8 -- from 0.0 to 1.0 | Change the volume.
}

Config.CustomColors = {
    -- Modal Border and Icons.
    primary = { -- This color will be changed when loading the script ! 
        change = true,
        value = 'rgb(50, 255, 0)'
    },
    -- Modal Text.
    textColor = { -- This color will not be changed when loading the script !
        change = false,
        value = ''
    },
    -- Modal background.
    background = { -- This color will not be changed when loading the script !
        change = false,
        value = ''
    }
}
```
</br>

### Example :
### Arguments (sended in a table):
* **icon**: Font Awesome or Boostrap | Modal title icon (can be set to nil or '' if you don't want an icon in your title).
* **title**: string | Modal title.
* **content**: string | Modal message.
* **delay**: milli second or false | Add or not an automatic cancellation delay.

- `With automatic cancellation`:
```lua
    local accepted = exports['esx_dialog']:CreateDialog({
        icon = 'fas fa-car',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?',
        delay = 5000, -- Automatic cancellation after 5000 ms.
    })

    if accepted then
        exports["esx_notify"]:Notify("info", 3000, "You are now the owner of this Benefactor Schafter V12 !")
    else
        exports["esx_notify"]:Notify("info", 3000, "Too bad it will be for another time, have a nice day !")
    end
```
</br>

- `Without automatic cancellation`:
```lua
    local accepted = exports['esx_dialog']:CreateDialog({
        icon = 'fas fa-car',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?',
        delay = false,
    })

    if accepted then
        exports["esx_notify"]:Notify("info", 3000, "You are now the owner of this Benefactor Schafter V12 !")
    else
        exports["esx_notify"]:Notify("info", 3000, "Too bad it will be for another time, have a nice day !")
    end
```
</br>

- `Without title icon`:
```lua
    local accepted = exports['esx_dialog']:CreateDialog({
        icon = '',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?',
        delay = 5000, -- Automatic cancellation after 5000 ms.
    })

    if accepted then
        exports["esx_notify"]:Notify("info", 3000, "You are now the owner of this Benefactor Schafter V12 !")
    else
        exports["esx_notify"]:Notify("info", 3000, "Too bad it will be for another time, have a nice day !")
    end
```
</br>

---
## Update:

### 1.0.0:
- Script will be released.
</br></br>

### 1.1.0:

### `Exports CreateDialog :`
- Now you can set a delay to create an automatic cancellation of the modal if the player take too much time to answer.
- Now you can set a custom color (border, background and text color) from the config.lua.

### `LUA file :`
- Adding a config file.
- "client.lua" : Increase wait time to show a modal if one is currently showed.
- Now from the config.lua you can activate or desactivate the modal sound.
- Now from the config.lua you can set the volume of modal sound.
- Now from the config.lua you can set the volume of modal sound.
- Now from the config.lua you can the modal colors (border, background and text color).

### `Java Script file :`
- Changed the way the modal transition class is added from .toggle() to .add() or .remove().
- Changing the way to concatenate a string from "".concat() to `${}`.
- Changing the way of declaring variables from "var" to "let".
- Optimization of some functions.
- Add a sound when the modal is in fade In.
- Load some settings from config.lua (sound option and modal colors) with an NUICallback .
</br></br>

---
## To do :
- Make ui responsive (if some one can explain to me how do that, send me a dm on discord: Slewog#1883 ).
- Add option to change all colors without open the css file.
- Found a solution to close the modal when a player relog with a modal opened (like when we you use multicharacter scripts but without making it dependent on a framework).
