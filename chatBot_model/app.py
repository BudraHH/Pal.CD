from flask import Flask, request, jsonify
from flask_cors import CORS

import random
import torch
import os  # Import the 'os' module for file operations
from model import NeuralNet
from train import all_words,model,tags
from chat import process


from nltk_utils import bag_of_words, tokenize
from intents_data import intents


app = Flask(__name__)

CORS(app)



@app.route('/get_response', methods=['GET'])
def get_response():
    try:
            
            msg = str(request.args['query'])
            return process(msg)
            
    except Exception as e:
        return {'error': str(e)}
        return jsonify({'error': str(e)})



if __name__ == "__main__":
    
    
    app.run(debug=True)
    

    
    
