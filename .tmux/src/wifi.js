#!/usr/bin/env node
import internalIp from 'internal-ip'
import wifi from 'node-wifi'

wifi.init({
  iface: null
})

const get_ssid = async () => {
  const connections = await wifi.getCurrentConnections()
  return connections[0].ssid
}

const connection = async () => {
  const ip = await internalIp.v4()
  const ssid = await get_ssid()
  return `\uf1eb  ${ip}@${ssid}`
}

connection().then(res =>
  console.log(res)
)
