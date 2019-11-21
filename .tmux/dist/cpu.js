#!/usr/bin/env node
'use strict';

var _systeminformation = require('systeminformation');

(0, _systeminformation.currentLoad)().then(res => {
  console.log(`CPU: ${res.avgload}%`);
});