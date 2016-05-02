#!/usr/bin/env python
# from https://www.rabbitmq.com/tutorials/tutorial-one-python.html

import pika


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')


channel.basic_consume(callback, queue='hello', no_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()
