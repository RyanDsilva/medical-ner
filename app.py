from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route('/', methods=['GET'])
def home():
    return jsonify('Server Up and Running')


@app.route('/ner', methods=['POST'])
def performNER():
    text = request.json['text']
    return jsonify('')


if __name__ == '__main__':
    app.run(host='0.0.0.0')
