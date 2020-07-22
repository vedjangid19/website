from flask import Flask, render_template, request, session, redirect
import json
from werkzeug import secure_filename
import os
import math
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
import datetime


with open("config.json","r") as c:
    params = json.load(c)["params"]
local_server = params['local_server']
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,

    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']

)
mail = Mail(app)

if local_server :
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_url']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_url']

db = SQLAlchemy(app)


class Contacts(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):

    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(12), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    tag_line = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


@app.route("/")
def home():
    post = Posts.query.filter_by().all()
    last = math.ceil(len(post) / int(params['no_of_post']))

    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    post = post[
            (page - 1) * int(params['no_of_post']):(page - 1) * int(params['no_of_post']) + int(params['no_of_post'])]
    if (page == 1):
        prev = "#"
        next1 = "/?page=" + str(page + 1)
    elif (page == last):
        prev = "/?page=" + str(page - 1)
        next1 = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next1 = "/?page=" + str(page + 1)


    return render_template('index.html', params=params, post = post,prev =prev,next1=next1)


@app.route("/about")
def about():
    return render_template('about.html', params=params)


@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))

    return "Upload successfully"


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>")
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            tline = request.form.get('tline')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.datetime.now()

            if sno == '0':
                post = Posts(title=box_title, slug=slug, content=content, tag_line=tline, date=date, img_file=img_file)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.tag_line = tline
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+sno)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, sno=sno, post=post)



@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.all()
        return render_template('dashboard.html', params=params, post=post)
    if request.method == "POST":
        username = request.form.get("uname")
        userpass = request.form.get("pass")
        if (username==params['admin_user'] and userpass == params['admin-password']):
            session['user'] = username
            post = Posts.query.all()
            return render_template('dashboard.html', params=params, post=post)
    return render_template('login.html', params=params)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == "POST":
        name = request.form.get("name")
        email = request.form.get("email")
        phone = request.form.get("phone")
        message = request.form.get("message")
        entry = Contacts(name = name, phone_num = phone, msg = message,date = datetime.datetime.now(), email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('A New Message from'+name,
                          sender = email,
                          recipients = params['gmail-user'],
                          body = message +"\n"+ phone
                          )
    return render_template('contact.html', params=params)


@app.route("/post/<string:slug_post>",methods=['GET'])
def post_route(slug_post):
    post = Posts.query.filter_by(slug=slug_post).first()
    return render_template('post.html', params=params, post=post)


@app.route("/sample-post")
def sample_post():
    post = Posts.query.all()
    return render_template('samplepost.html', params=params, post=post)

app.run(debug=True)