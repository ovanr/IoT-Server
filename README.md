# IoT-Server

A IoT-Server app that communicates with devices running [IoT-Client](https://github.com/ovanr/IoT-client). 
It will forward their data to relational (MySQL) and non-relational (InfluxDB) databases and it can additionally forward commands to the devices. 
To communicate with the IoT devices it uses a RabbitMQ broker intermediary. 
All messages exchanged between them are MQTT or AMQP messages.

## Architecture

![Architecture Diagram](https://github.com/ovanr/IoT-Server/raw/main/architecture.png)

## Installation

Simply run:

`stack build`

## Usage

Start server with: 

`stack exec iot-server -- -vv`

## Notice

This program was developed for the [Kamposnet](https://kampos.eu/) Research Project 
