#!/usr/bin/env node

import {battery} from 'systeminformation'

const batteryIcon = (percent, acconnected) => {
  if (acconnected) {
    return "\uf583"
  }
  if (percent < 16) {
    return "\uf582"
  } else if (percent < 20) {
    return "\uf57a"
  } else if (percent < 30) {
    return "\uf57b"
  } else if (percent < 40) {
    return "\uf57c"
  } else if (percent < 50) {
    return "\uf57d"
  } else if (percent < 60) {
    return "\uf57e"
  } else if (percent < 70) {
    return "\uf57f"
  } else if (percent < 80) {
    return "\uf580"
  } else if (percent < 90) {
    return "\uf581"
  }
  return "\uf578"
}

battery().then(data =>
  console.log(`${batteryIcon(data.percent, data.acconnected)} ${data.percent}% `)
)
