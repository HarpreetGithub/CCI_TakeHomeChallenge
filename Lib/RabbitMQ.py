import pika

class RabbitMQ_Lib(object):

    """ Class for all the RabbitMQ actions/keywords"""

    def __init__(self):
        __version__ = '1.0.0'
        ROBOT_LIBRARY_VERSION = __version__
        ROBOT_LIBRARY_SCOPE= 'GLOBAL'
        
        # Start a connection
        self.connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
        
        # Create a channel
        self.channel = self.connection.channel()
        
        # Declare a exchange, create if needed
        self.channel.exchange_declare(exchange= 'atlantis')
        
        # Declare a queue, create if needed
        self.channel.queue_declare(queue= 'atlantis-queue')
        
        # Bind exchange and queue 
        self.channel.queue_bind(exchange= 'atlantis', queue= 'atlantis-queue')

    def RabbitMQ_send_message(self, msg):

        """ Publish to the channel with the given exchange, routing key and body 
            Input: msg 
            Parameters:	
                    exchange (str) - The exchange to publish to
                    routing_key (str) - The routing key to bind on
                    body (bytes) - The message body
        """

        self.channel.basic_publish(exchange='atlantis',
                        routing_key='atlantis-queue',
                        body=msg)

        print(" [x] Sent %s" % msg)

    def RabbitMQ_receive_message(self):

        """ Getting single message from RabbitMQ atlantis-queue
            Returns:
                body: message body.
                If queue is empty, returns None, None, None.
        """

        method, properties, body = self.channel.basic_get(queue= "atlantis-queue")
        if not (method and properties and body):
            return None, None, None
        else:
            delivery_data = {
                'delivery_tag': method.delivery_tag,
                'redelivered': method.redelivered,
                'exchange': method.exchange,
                'routing_key': method.routing_key,
                'message_count': method.message_count
            }

        delivery_tag = delivery_data['delivery_tag']
        
        # Acknowledge one or more messages. When sent by the client, 
        # this method acknowledges one or more messages delivered
        self.channel.basic_ack(delivery_tag=delivery_tag)
        print(method)
        return body

    def RabbitMQ_close_connection(self):

        """ Gracefully Shutdown the connection"""

        self.connection.close()

