#!/usr/bin/env node

import { currentLoad as cpuLoad, cpu as cpuInfo } from 'systeminformation'

cpuLoad().then((res) => {
  console.log(`CPU: ${res.avgload}%`)
})

cpuInfo().then((res) => {
  console.log(res)
})
