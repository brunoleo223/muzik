import numpy as np
import pandas as pd
from scipy import stats
from sklearn.linear_model import SGDRegressor
from sklearn.tree import DecisionTreeRegressor
from sklearn.preprocessing import StandardScaler
import psycopg2
from psycopg2.extensions import register_adapter, AsIs
psycopg2.extensions.register_adapter(np.int64, psycopg2._psycopg.AsIs)

class Recommender():
    def __init__(self, music_styles):
        self.music_styles = music_styles
        pass

    def get_music_styles(self, users):
        """ get all differents music styles from users

        Args:
            users (list): a list of users

        Returns:
            [set]: unique values of music styles
        """
        music_styles = list(self.music_styles)
        for new_user in users:
            music_styles += new_user['music_styles']
        return set(music_styles)

    def prepare_data(self, users):
        """Prepare the data for the next methods

        Args:
            users (list): a list of users
        Return:
            [Dataframe]: users with the data modifications
        """
        
        music_styles = self.get_music_styles(users)

        users_values = []
        for new_user in users:
            user_features = [new_user['id'], new_user['age'], new_user['city']]
            for music_style in music_styles:
                if music_style in new_user['music_styles']:
                    user_features += [1]
                else:
                    user_features += [0]
            users_values.append(user_features.copy())

        users_df  = pd.DataFrame(users_values, columns=['id', 'age', 'city'] + list(music_styles))

        users_df["city"] = users_df["city"].astype('category').cat.codes

        return users_df

    def find_correlation_users(self, user1, user2):
        """Find the correlation between two users

        Args:
            user1 (Array): user for whom recommendations will be sought
            user2 (Array): user that can have common interests

        Returns:
            [float]: how related users are.
        """
        (correlation, p_value) = stats.pearsonr(user1, user2)
        if p_value < 0.05:
            return correlation
        else:
            return None


    def get_users_reaction(self, user_id):
        """get users who saw a determined user as suggestion

        Args:
            user_id (int): user who was recommended for other users

        Returns:
            [dataframe]: list of users who saw the recommendation
        """

        conn = psycopg2.connect("dbname=muzik user=postgres password=89503572")
        cur = conn.cursor()

        cur.execute("""select id, age, city, recommendation_grade from person, grade 
                        where id_connection = %s and id = id_user;""", (user_id,))
        result = cur.fetchall()

        users = []
        grades = []
        for value in result:
            user = {}
            user['id'], user['age'], user['city'] = value[:-1]
            grades.append(value[-1])
            cur.execute("""select title from music_style, person_music_style 
                        where id_person = %s and id = id_music_style;""", (user['id'],))
            music_styles = cur.fetchall()
            user['music_styles'] = []
            for style in music_styles:
                user['music_styles'].append(style[0])
            users.append(user)

        conn.close()
        
        return self.prepare_data(users), grades

    def find_best_connections(self, user, users, rec_type):
        """try predict if a user will like or not the recommendation

        Args:
            user (Array): user for whom recommendations will be sought
            users (dataframe): users who rated determined recommendation

        Returns:
            [list]: list of user that are the best suggestions
        """
        users_df = self.prepare_data(users)
        user_df = self.prepare_data([user])

        new_users = []
        for i in range(users_df.shape[0]):
            correlation = self.find_correlation_users(user_df.iloc[0, :], users_df.iloc[i, :])
            if (correlation is not None) and (correlation > 0.7):
                new_users.append(users_df.iloc[i, 0])

        recommendations = []
        for new_user in new_users:
            X, y = self.get_users_reaction(new_user)

            scaled_X = StandardScaler().fit_transform(X.values)
            scaled_user = StandardScaler().fit_transform(user_df.values)

            sgd = SGDRegressor(max_iter=1000, tol=1e-3)
            sgd.fit(scaled_X, y)
            y_predict = sgd.predict(scaled_user)
            if rec_type == 0:
                if(y_predict > 2 and y_predict <= 4):
                    recommendations.append(new_user)
            else:
                if(y_predict > 4):
                    recommendations.append(new_user)

        users_result = []

        conn = psycopg2.connect("dbname=muzik user=postgres password=89503572")
        cur = conn.cursor()

        for recommendation in recommendations:
            cur.execute("""select * from person 
                        where id=%s""", (recommendation,))

            sql_result = cur.fetchone()
            result = {
                'id': sql_result[0],
                'name': sql_result[1],
                'age': sql_result[2],
                'email': sql_result[3],
                'city': sql_result[4], 
                'gender': sql_result[7],
                'image': sql_result[8]
            }

            users_result.append(result)

        
        return users_result
            





