#!/usr/bin/env node

import { currentLoad as cpuLoad } from 'systeminformation'

cpuLoad().then((res) => {
  console.log(`CPU: ${res.avgload}%`)
})
