import json
from flask import Flask, jsonify, make_response, redirect, render_template, request


app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def main():
    if request.method == "GET":
        return render_template('main.html')
    if request.method == 'POST':
        user_data = str(request.form.get('user_data'))
        city = str(request.form.get('city'))
        return redirect('/{}/{}'.format(user_data, city))

@app.route('/students/<city>', methods=['GET'])
def students(city):
    f=open('./data/{}/students.json'.format(city), "rb")
    info_load = json.load(f)
    for i in info_load:
        s += str(i) 
    return s
   


@app.route('/faculty/<city>', methods=['GET'])
def faculty(city):
    f=open('./data/{}/faculty.json'.format(city), "rb")
    info_load = json.load(f)
    for i in info_load:
        s += str(i)
    return s
  

if __name__ == '__main__':
    app.run(debug = True)