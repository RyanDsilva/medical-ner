from flask import Flask, request, jsonify
from medicalner import MedicalNER

app = Flask(__name__)
NER = MedicalNER()


@app.route('/', methods=['GET'])
def home():
    return jsonify('Server Up and Running')


@app.route('/ner', methods=['POST'])
def performNER():
    text = request.json['text']
    res = NER.getTags(text)
    return jsonify(res)


if __name__ == '__main__':
    app.run()
