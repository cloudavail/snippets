#!/usr/bin/env python3

import boto3
import json

# the pricing API is only available in two regions
# us-east-1 and ap-south-1
# https://docs.aws.amazon.com/general/latest/gr/rande.html
pricing_client = boto3.client('pricing', region_name='us-east-1')

# ServiceCodes are available via the following call
# aws pricing describe-services --region us-east-1
service_code = 'AmazonEC2'
# the product filters will change depending on ServiceCode provided
product_filters = [
    {'Type': 'TERM_MATCH', # TERM_MATCH is currently the only type of filter offered
     'Field': 'location',
     'Value': 'US West (N. California)'},
    {'Type': 'TERM_MATCH', # TERM_MATCH is currently the only type of filter offered
     'Field': 'volumeType',
     'Value': 'General Purpose'}
]

products_response = pricing_client.get_products(ServiceCode=service_code, Filters=product_filters)

print("Printing Products...")
print(products_response)

# the actual filtered "products" returned are returned in products_response['PriceList']
for product in products_response['PriceList']:
    # the returned products are strings/unicode objects, not dicts (see: https://github.com/boto/boto3/issues/1569)
    product_as_dict = json.loads(product)
    print(product_as_dict)
