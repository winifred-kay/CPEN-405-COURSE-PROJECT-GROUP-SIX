#Importing neccessary datasets
import numpy as np
import pandas as pd
import matplotlib as plt
import seaborn as sns
import matplotlib.pyplot as plt
import pickle as pkl
from flask import Flask, render_template, request, flash
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import classification_report
from sklearn.linear_model import LogisticRegression

app = Flask(__name__, template_folder='template')
app.secret_key = "johnson_secretKEYYS"

@app.route("/")
def home():
	return render_template("index.html")

@app.route("/diagnosis", methods=["POST", "GET"])
def diagnosis():
	#Data Wrangling
	filepath = 'C:/Users/ACER/OneDrive/Documents/Datasets/Heart Disease/heart.csv'
	data = pd.read_csv(filepath)
	X = data.iloc[:, :-1].values
	y = data.iloc[:, -1].values
	#Splitting data set
	x_train, x_test, y_train, y_test = train_test_split(
    	X,
    	y,
    	test_size = 0.2,
    	random_state = 1)
	#Standardizing the data
	sc = StandardScaler()
	x_train = sc.fit_transform(x_train)
	x_test = sc.transform(x_test)
	#Using Logistic Regression for classification
	model = LogisticRegression(random_state = 1)
	model.fit(x_train, y_train)
	y_pred = model.predict(x_test)

	age = request.form['age']
	sex = request.form['sex']
	cp = request.form['cp']
	rbsg = request.form['rbsg']
	chol = request.form['chol']
	fbsg = request.form['fbsg']
	restecg = request.form['restecg']
	thalach = request.form['thalach']
	exang = request.form['exang']
	oldpeak = request.form['oldpeak']
	slope = request.form['slope']
	ca = request.form['ca']
	thal = request.form['ca']

	user_input = sc.transform([[
		age,
		sex,
		cp,
		rbsg,
		chol,
		fbsg,
		restecg,
		thalach,
		exang,
		oldpeak,
		slope,
		ca,
		thal]])

	out = model.predict(user_input)
	if out == 1:
		flash("You might be prone to Heart disease. Consult your physician.")
	else:
		flash("Heart disease free! Keep exercising and eating healthy.")

	return render_template("index.html")