import flask
from flask import request, jsonify
from recommender import Recommender
import psycopg2

app = flask.Flask(__name__)

@app.route('/api/recommendation', methods=['GET'])
def api_id():
    if 'id' in request.args and 'type' in request.args:
        id = int(request.args['id'])
        rec_type = int(request.args['type'])
    else:
        return "Error: No id field provided. Please specify an id."

    conn = psycopg2.connect("dbname=muzik user=postgres password=89503572")
    cur = conn.cursor()

    cur.execute("""select id, age, city from person
                where id = %s;""", (id,))
    user = {}
    user['id'], user['age'], user['city'] = cur.fetchone()

    cur.execute("""select id, title from music_style, person_music_style 
                where id_person = %s and id = id_music_style;""", (id,))

    music_styles = cur.fetchall()

    user['music_styles'] = []
    for music_style in music_styles:
        user['music_styles'].append(music_style[1])

    music_styles_temp = music_styles.copy()
    for (id_music, _) in music_styles:
        cur.execute("""select id, title from music_style, music_relation 
                    where id_music = %s and id = id_relation;""", (id_music,))

        music_styles_temp += cur.fetchall()
    music_styles = []
    users = []
    for (id_music, _) in set(music_styles_temp):
        cur.execute("""select id, age, city from person, person_music_style 
                        where id_music_style = %s and id = id_person;""", (id_music,))

        result = cur.fetchall()

        for value in result:
            user_temp = {}
            user_temp['id'], user_temp['age'], user_temp['city'] = value

            cur.execute("""select id from person, connection 
                        where id_user = id and id = %s and id_connection = %s;""", (id, user_temp['id'],))
            count = len(cur.fetchall())
            if(count == 0):
                cur.execute("""select id from person, unlike
                            where id_user = id and id = %s and id_suggestion = %s;""", (id, user_temp['id'],))
                count = len(cur.fetchall())
                if(count == 0):
                    if user_temp['id'] != user['id'] and (not any(us['id'] == user_temp['id'] for us in users)):
                        cur.execute("""select title from music_style, person_music_style 
                                where id_person = %s and id = id_music_style;""", (user_temp['id'],))
                        music_styles_user = cur.fetchall()

                        user_temp['music_styles'] = []
                        for style in music_styles_user:
                            user_temp['music_styles'].append(style[0])
                        users.append(user_temp)

    cur.execute("""select title from music_style;""")
    music_styles_response = cur.fetchall()
    music_styles = []
    for style in music_styles_response:
        music_styles.append(style[0])
    
    conn.close()
    response = jsonify(Recommender(music_styles).find_best_connections(user, users, rec_type))
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/api/connection', methods=['GET'])
def register_connection():
    id, id_con = request.args['id_user'], request.args['id_con']
    conn = psycopg2.connect("dbname=muzik user=postgres password=89503572")
    cur = conn.cursor()
    cur.execute("""insert into connection values (%s, %s);""", (id, id_con))
    conn.commit()
    conn.close()
    response = jsonify(True)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route('/api/reject', methods=['GET'])
def register_rejection():
    id, id_con = request.args['id_user'], request.args['id_con']
    conn = psycopg2.connect("dbname=muzik user=postgres password=89503572")
    cur = conn.cursor()
    cur.execute("""insert into unlike values (%s, %s);""", (id, id_con))
    conn.commit()
    conn.close()
    response = jsonify(True)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

if __name__ == '__main__':
     app.run(port='5002')