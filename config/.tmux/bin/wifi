#!/usr/bin/env node
'use strict';

var _internalIp = require('internal-ip');

var _internalIp2 = _interopRequireDefault(_internalIp);

var _nodeWifi = require('node-wifi');

var _nodeWifi2 = _interopRequireDefault(_nodeWifi);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

_nodeWifi2.default.init({
  iface: null
});

const get_ssid = async () => {
  const connections = await _nodeWifi2.default.getCurrentConnections();
  return connections[0].ssid;
};

const connection = async () => {
  const ip = await _internalIp2.default.v4();
  const ssid = await get_ssid();
  return `\uf1eb  ${ip}@${ssid}`;
};

connection().then(res => console.log(res));