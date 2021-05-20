# IoT-Server

A simple IoT-Server app that listens for data 
received from IoT-devices that run 
[IoT-Client](https://github.com/ovanr/IoT-client) 
and forwards them to relational (MySQL) and non-relational 
(InfluxDB) databases. It can additionally forward commands
to the devices. To communicate with the IoT-Devices it uses 
a RabbitMQ broker intermediary. All messages exchanged between 
them are MQTT or AMQP messages.

## Installation

Simply run:

`stack build`

## Usage

Start server with: 

`stack exec iot-server -- -vv`

## Notice

This program was developed for the [Kamposnet](https://kampos.eu/) Research Project 
