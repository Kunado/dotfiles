#!/usr/bin/env node
'use strict';

var _systeminformation = require('systeminformation');

const get_memory = () => {
  return (0, _systeminformation.mem)().then(data => {
    const total_memory = get_Mb(data.total);
    const active_memory = get_Mb(data.active);

    return {
      active_memory: active_memory,
      total_memory: total_memory
    };
  });
};

const get_Mb = byte => {
  return (byte / 1024 / 1024).toFixed(0);
};

get_memory().then(res => {
  const percentage = (res.active_memory / res.total_memory * 100).toFixed(0);
  console.log(`\uf85a ${percentage}%:${res.active_memory}MB/${res.total_memory}MB `);
});