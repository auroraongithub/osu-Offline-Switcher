window.main.receive("sheesh", (arg) => {
        window.main.send("poopie", { path: "./Firewall Rule Setup.bat", args: arg })
    })
    // This file is required by the index.html file and will
    // be executed in the renderer process for that window.
    // No Node.js APIs are available in this process because
    // `nodeIntegration` is turned off. Use `preload.js` to
    // selectively enable features needed in the rendering
    // process.
btnswitch.addEventListener('click', () => {
    window.main.send("poopie", { path: "./osu! offline switcher.bat", args: null })
})
btnrule.addEventListener('click', () => {
    window.main.send("anotherpoopie")
})