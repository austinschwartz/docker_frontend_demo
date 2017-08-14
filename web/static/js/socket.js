import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()


let channel = socket.channel("run", {});
let list    = $('#run-list');

channel.on('run_instance', payload => {
  list.append(`<tr><td>${payload.testcase_id}</td><td>${payload.status}</td><td>${payload.time}</td></tr>`);
  console.log(payload);
});

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })



export default socket

