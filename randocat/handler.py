import json
import os
import pprint

import psycopg2


def hello(event, context):
    body = {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "input": event
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response

def dbversion(event, context):
    print(os.environ.get('DB_PORT'))
    try:
        conn = psycopg2.connect(host=os.environ.get('DB_HOST'), 
                                user=os.environ.get('POSTGRES_USER'), 
                                password=os.environ.get('POSTGRES_PASSWORD'), 
                                # port=os.environ.get('POSTGRES_PORT'), 
                                dbname=os.environ.get('POSTGRES_DBNAME'))
        return "Connection established"
    except psycopg2.DatabaseError as err:
        return str(err)

    cur = conn.cursor()
    cur.execute("SELECT version();")
    response = {
        "statusCode": 200,
        "body": json.dumps(cur.fetchall())
    }
    return response

if __name__ == "__main__":
    pprint.pprint(hello('', ''))
