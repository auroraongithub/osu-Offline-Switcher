import { contextBridge, ipcRenderer } from "electron";

let validSendChannels = ["poopie", "anotherpoopie"]
let validReceiveChannels = ["sheesh"]
contextBridge.exposeInMainWorld(
  "main", {
  send: (channel, data) => {
    if (validSendChannels.includes(channel)) {
      ipcRenderer.invoke(channel, data);
    }
  },
  receive: (channel, func) => {
    if (validReceiveChannels.includes(channel)) {
      // Deliberately strip event as it includes `sender` 
      ipcRenderer.handle(channel, (event, ...args) => func(...args));
    }
  }
});
