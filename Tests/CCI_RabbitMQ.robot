*** Settings ***
Documentation  RabbitMQ simple send and receive message
Library  ../Lib/RabbitMQ.py

*** Test Cases ***
Verify RabbitMQ message broker
    [documentation]  Test verify that the message send can be read from the atlantis queue
    RabbitMQ Send Message  CCI_Harpreet
    ${result}=  RabbitMQ Receive Message
    Should be Equal As Strings  ${result}  CCI_Harpreet
    RabbitMQ Close Connection