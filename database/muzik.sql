--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: connection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connection (
    id_user integer NOT NULL,
    id_connection integer NOT NULL
);


ALTER TABLE public.connection OWNER TO postgres;

--
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    id_user integer NOT NULL,
    id_connection integer NOT NULL,
    recommendation_grade double precision
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- Name: music_relation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.music_relation (
    id_music integer NOT NULL,
    id_relation integer NOT NULL
);


ALTER TABLE public.music_relation OWNER TO postgres;

--
-- Name: music_style; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.music_style (
    id integer NOT NULL,
    title text
);


ALTER TABLE public.music_style OWNER TO postgres;

--
-- Name: music_style_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.music_style_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.music_style_id_seq OWNER TO postgres;

--
-- Name: music_style_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.music_style_id_seq OWNED BY public.music_style.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name text NOT NULL,
    age integer,
    email text,
    city text,
    password text NOT NULL,
    musician boolean,
    gender character(1),
    image text
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person_music_style; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person_music_style (
    id_person integer NOT NULL,
    id_music_style integer NOT NULL
);


ALTER TABLE public.person_music_style OWNER TO postgres;

--
-- Name: unlike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unlike (
    id_user integer NOT NULL,
    id_suggestion integer NOT NULL
);


ALTER TABLE public.unlike OWNER TO postgres;

--
-- Name: music_style id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_style ALTER COLUMN id SET DEFAULT nextval('public.music_style_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connection (id_user, id_connection) FROM stdin;
1	2
2	3
7	8
\.


--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (id_user, id_connection, recommendation_grade) FROM stdin;
1	2	3
2	1	2.5
2	3	3.5
3	2	3.5
1	5	4.5
1	7	3.5
2	4	5
2	8	3.5
1	8	4.5
7	8	4
2	6	5
6	1	5
6	2	5
7	3	5
4	5	2
3	6	5
\.


--
-- Data for Name: music_relation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.music_relation (id_music, id_relation) FROM stdin;
123	124
123	126
123	127
123	129
123	130
123	139
123	140
123	142
123	149
123	152
123	154
123	157
123	158
123	161
123	169
123	174
123	175
123	182
124	123
124	126
124	129
124	131
124	136
124	138
124	139
124	142
124	144
124	149
124	152
124	153
124	154
124	157
124	158
124	161
124	162
124	173
124	174
124	179
124	182
125	126
125	127
125	128
125	129
125	130
125	137
125	143
125	144
125	145
125	146
125	147
125	148
125	156
125	158
125	162
125	163
125	164
125	166
125	168
125	170
125	171
125	173
125	176
125	177
125	179
126	123
126	124
126	125
126	127
126	129
126	130
126	131
126	137
126	138
126	142
126	144
126	145
126	146
126	147
126	148
126	152
126	154
126	157
126	158
126	161
126	163
126	170
126	172
126	173
126	174
126	175
126	177
126	179
126	180
126	182
127	123
127	125
127	126
127	130
127	131
127	136
127	138
127	140
127	141
127	142
127	148
127	150
127	157
127	158
127	161
127	168
127	170
127	173
127	174
127	175
127	180
127	182
128	125
128	132
128	133
128	134
128	137
128	144
128	145
128	146
128	147
128	155
128	159
128	162
128	164
128	165
128	171
128	176
128	181
129	123
129	124
129	125
129	126
129	130
129	131
129	132
129	134
129	136
129	137
129	143
129	145
129	146
129	147
129	151
129	155
129	158
129	159
129	162
129	163
129	164
129	170
129	171
129	175
129	176
129	179
129	181
129	182
130	123
130	125
130	126
130	127
130	129
130	136
130	144
130	157
130	158
130	160
130	162
130	166
130	170
130	172
130	179
130	180
130	182
131	124
131	126
131	127
131	129
131	135
131	136
131	137
131	138
131	144
131	148
131	149
131	152
131	158
131	170
131	172
131	175
131	182
132	128
132	129
132	134
132	135
132	137
132	139
132	143
132	144
132	145
132	146
132	147
132	151
132	155
132	156
132	159
132	162
132	163
132	164
132	165
132	171
132	176
132	181
133	128
133	134
133	137
133	140
133	144
133	152
133	153
133	160
133	162
133	166
133	167
133	180
134	128
134	129
134	132
134	133
134	136
134	137
134	144
134	145
134	146
134	147
134	151
134	152
134	155
134	159
134	162
134	163
134	164
134	171
134	176
134	180
134	181
135	131
135	132
135	142
135	144
135	150
135	155
135	156
135	161
135	162
135	165
135	167
135	172
135	175
135	180
135	181
136	124
136	127
136	129
136	130
136	131
136	134
136	137
136	138
136	140
136	145
136	148
136	149
136	150
136	152
136	157
136	173
136	174
136	175
136	177
136	179
137	125
137	126
137	128
137	129
137	131
137	132
137	133
137	134
137	136
137	143
137	144
137	145
137	146
137	147
137	151
137	155
137	159
137	163
137	164
137	169
137	170
137	171
137	176
137	177
137	181
138	124
138	126
138	127
138	131
138	136
138	139
138	148
138	149
138	152
138	157
138	169
138	172
138	174
138	175
138	182
139	123
139	124
139	132
139	138
139	145
139	149
139	152
139	153
139	154
139	155
139	156
139	159
139	164
139	165
139	170
139	171
139	172
139	176
139	177
139	180
139	181
140	123
140	127
140	133
140	136
140	149
140	152
140	157
140	172
140	179
140	182
141	127
141	153
141	165
141	175
141	177
142	123
142	124
142	126
142	127
142	135
142	146
142	147
142	148
142	155
142	161
142	166
142	170
142	175
142	182
143	125
143	129
143	132
143	137
143	151
143	155
143	159
143	164
143	165
143	170
143	171
144	124
144	125
144	126
144	128
144	130
144	131
144	132
144	133
144	134
144	135
144	137
144	145
144	146
144	147
144	149
144	150
144	153
144	156
144	162
144	163
144	165
144	166
144	167
144	170
144	174
144	178
144	180
145	125
145	126
145	128
145	129
145	132
145	134
145	136
145	137
145	139
145	144
145	146
145	147
145	151
145	155
145	156
145	159
145	162
145	163
145	164
145	166
145	170
145	171
145	176
145	181
146	125
146	126
146	128
146	129
146	132
146	134
146	137
146	142
146	144
146	145
146	146
146	147
146	148
146	151
146	155
146	159
146	162
146	163
146	164
146	165
146	166
146	170
146	171
146	176
146	181
147	125
147	126
147	128
147	129
147	132
147	134
147	137
147	142
147	144
147	145
147	146
147	148
147	151
147	155
147	159
147	163
147	164
147	166
147	167
147	170
147	171
147	176
147	181
148	125
148	126
148	127
148	131
148	136
148	138
148	142
148	146
148	147
148	155
148	158
148	161
148	166
148	167
148	168
148	170
148	174
148	175
148	179
148	181
149	123
149	124
149	131
149	136
149	138
149	139
149	140
149	144
149	150
149	152
149	153
149	154
149	161
149	168
149	169
149	170
149	172
149	173
149	174
149	177
149	179
149	182
150	127
150	135
150	136
150	144
150	149
150	152
150	162
150	172
150	182
151	129
151	132
151	134
151	137
151	143
151	145
151	146
151	147
151	155
151	159
151	163
151	164
151	170
151	171
151	176
151	181
152	123
152	124
152	126
152	131
152	133
152	134
152	136
152	138
152	139
152	140
152	149
152	150
152	153
152	161
152	168
152	169
152	172
152	174
152	179
152	182
153	124
153	133
153	139
153	141
153	144
153	149
153	152
153	156
153	170
153	172
153	180
154	123
154	124
154	126
154	139
154	149
154	156
154	174
155	128
155	129
155	132
155	134
155	135
155	137
155	139
155	142
155	143
155	145
155	146
155	147
155	148
155	151
155	156
155	159
155	163
155	164
155	170
155	171
155	176
155	181
156	125
156	132
156	135
156	139
156	144
156	145
156	153
156	154
156	155
156	159
156	165
156	170
156	171
157	123
157	124
157	126
157	127
157	130
157	136
157	138
157	140
157	158
157	161
157	170
157	174
157	175
157	182
158	123
158	124
158	125
158	126
158	127
158	129
158	130
158	131
158	148
158	157
158	170
158	174
158	175
158	180
158	182
159	128
159	129
159	132
159	134
159	137
159	139
159	143
159	145
159	146
159	147
159	151
159	155
159	156
159	164
159	170
159	171
159	175
159	176
159	181
160	130
160	133
161	123
161	124
161	126
161	127
161	135
161	142
161	148
161	149
161	152
161	157
161	168
161	174
161	175
161	182
162	124
162	125
162	128
162	129
162	130
162	132
162	133
162	134
162	135
162	144
162	145
162	146
162	150
162	163
162	170
162	176
162	180
162	181
163	125
163	126
163	129
163	132
163	134
163	137
163	144
163	145
163	146
163	147
163	151
163	155
163	162
163	164
163	171
163	176
163	181
164	125
164	128
164	129
164	132
164	134
164	137
164	139
164	143
164	145
164	146
164	147
164	151
164	155
164	159
164	163
164	165
164	170
164	171
164	176
164	181
165	128
165	132
165	135
165	139
165	141
165	143
165	144
165	146
165	156
165	164
165	170
165	171
165	176
166	125
166	130
166	133
166	142
166	144
166	145
166	146
166	147
166	148
166	168
166	170
166	171
167	133
167	135
167	144
167	147
167	148
167	168
167	169
167	170
167	178
168	125
168	127
168	148
168	149
168	152
168	161
168	166
168	167
168	169
168	170
168	172
169	123
169	137
169	138
169	149
169	152
169	167
169	168
169	172
169	174
170	125
170	126
170	127
170	129
170	130
170	131
170	137
170	139
170	142
170	143
170	144
170	145
170	146
170	147
170	148
170	149
170	151
170	153
170	155
170	156
170	157
170	158
170	159
170	162
170	164
170	165
170	166
170	167
170	168
170	171
170	176
170	177
170	181
171	125
171	128
171	129
171	132
171	134
171	137
171	139
171	143
171	145
171	146
171	147
171	151
171	155
171	156
171	159
171	163
171	164
171	165
171	166
171	170
171	176
171	181
172	126
172	130
172	131
172	135
172	138
172	139
172	140
172	149
172	150
172	152
172	153
172	168
172	169
172	173
172	174
172	179
172	182
173	124
173	125
173	126
173	127
173	136
173	149
173	172
173	174
173	177
173	179
173	181
174	123
174	124
174	126
174	127
174	136
174	138
174	144
174	148
174	149
174	152
174	154
174	157
174	158
174	161
174	169
174	172
174	173
174	175
174	179
174	182
175	123
175	126
175	127
175	129
175	131
175	135
175	136
175	138
175	141
175	142
175	148
175	157
175	158
175	159
175	161
175	174
175	182
176	125
176	128
176	129
176	132
176	134
176	137
176	139
176	145
176	146
176	147
176	151
176	155
176	159
176	162
176	163
176	164
176	165
176	170
176	171
176	181
177	125
177	126
177	136
177	137
177	139
177	141
177	149
177	170
177	173
177	178
177	179
177	181
178	144
178	167
178	177
179	124
179	125
179	126
179	129
179	130
179	136
179	140
179	148
179	149
179	152
179	172
179	173
179	174
179	177
179	182
180	126
180	127
180	130
180	133
180	134
180	135
180	139
180	144
180	153
180	158
180	162
180	181
181	128
181	129
181	132
181	134
181	135
181	137
181	139
181	145
181	146
181	147
181	148
181	151
181	155
181	159
181	162
181	163
181	164
181	170
181	171
181	173
181	176
181	177
181	180
182	123
182	124
182	126
182	127
182	129
182	130
182	131
182	138
182	140
182	142
182	149
182	150
182	152
182	157
182	158
182	161
182	172
182	174
182	175
182	179
\.


--
-- Data for Name: music_style; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.music_style (id, title) FROM stdin;
123	Baião
124	Batucada
125	Blues
126	Bossa Nova
127	Brega
128	Britpop
129	Choro
130	Clássica
131	Country
132	Dance-punk
133	Disco
134	Dream pop
135	Eletronica
136	Fandango
137	Folk
138	Forró
139	Forrocore
140	Frevo
141	Funk
142	Gospel
143	Gótica
144	Hip Hop
145	Indie
146	Indie folk
147	Indie pop
148	Jazz
149	Lambada
150	Latin house
151	Madchester
152	Mambo
153	Manguebeat
154	Maracatu
155	Math rock
156	Metal
157	Moda de viola
158	MPB
159	Noise rock
160	Ópera
161	Pagode
162	Pop
163	Pop Barroco
164	Post-punk revival
165	Punk
166	R&B
167	Rap
168	Reggae
169	Repente
170	Rock
171	Rock de garagem
172	Rumba
173	Salsa
174	Samba
175	Sertanejo
176	Slowcore
177	Soul
178	Stronda
179	Tango
180	Tecnobrega
181	Twee pop
182	Xote
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, name, age, email, city, password, musician, gender, image) FROM stdin;
2	Bruno Leonardo	24	brunoleo@gmail.com	SÆo Paulo	123teste1	f	M	match_user_photo
1	Robson	20	robson.teixeira2000@gmail.com	Canind‚	123teste	f	M	match_user_photo_3
3	Kamila Durazzo	26	kamila@gmail.com	SÆo Paulo	123teste2	f	F	match_user_photo_4
4	teste1	12	a@gmail.com	SÆo Paulo	test123	f	F	match_user_photo_2
5	teste2	29	a@gmail.com	SÆo Paulo	test123	f	M	match_user_photo_2
6	teste3	32	a@gmail.com	SÆo Paulo	test123	f	F	match_user_photo_2
7	teste4	65	a@gmail.com	SÆo Paulo	test123	f	F	match_user_photo_2
8	teste4	18	a@gmail.com	SÆo Paulo	test123	f	M	match_user_photo_2
\.


--
-- Data for Name: person_music_style; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person_music_style (id_person, id_music_style) FROM stdin;
1	150
1	135
1	129
2	127
2	182
3	152
3	123
3	181
2	129
2	170
4	175
4	125
4	181
5	131
5	143
5	167
6	167
6	169
6	180
6	182
7	134
7	144
7	154
8	164
8	174
8	182
\.


--
-- Data for Name: unlike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unlike (id_user, id_suggestion) FROM stdin;
7	8
\.


--
-- Name: music_style_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.music_style_id_seq', 182, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 8, true);


--
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_pkey PRIMARY KEY (id_user, id_connection);


--
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id_user, id_connection);


--
-- Name: music_relation music_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_relation
    ADD CONSTRAINT music_relation_pkey PRIMARY KEY (id_music, id_relation);


--
-- Name: music_style music_style_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_style
    ADD CONSTRAINT music_style_pkey PRIMARY KEY (id);


--
-- Name: person_music_style person_music_style_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_music_style
    ADD CONSTRAINT person_music_style_pkey PRIMARY KEY (id_person, id_music_style);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: unlike unlike_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unlike
    ADD CONSTRAINT unlike_pkey PRIMARY KEY (id_user, id_suggestion);


--
-- Name: connection connection_id_connection_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_id_connection_fkey FOREIGN KEY (id_connection) REFERENCES public.person(id);


--
-- Name: connection connection_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.person(id);


--
-- Name: grade grade_id_connection_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_id_connection_fkey FOREIGN KEY (id_connection) REFERENCES public.person(id);


--
-- Name: grade grade_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.person(id);


--
-- Name: music_relation music_relation_id_music_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_relation
    ADD CONSTRAINT music_relation_id_music_fkey FOREIGN KEY (id_music) REFERENCES public.music_style(id);


--
-- Name: music_relation music_relation_id_relation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.music_relation
    ADD CONSTRAINT music_relation_id_relation_fkey FOREIGN KEY (id_relation) REFERENCES public.music_style(id);


--
-- Name: person_music_style person_music_style_id_music_style_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_music_style
    ADD CONSTRAINT person_music_style_id_music_style_fkey FOREIGN KEY (id_music_style) REFERENCES public.music_style(id);


--
-- Name: person_music_style person_music_style_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person_music_style
    ADD CONSTRAINT person_music_style_id_person_fkey FOREIGN KEY (id_person) REFERENCES public.person(id);


--
-- Name: unlike unlike_id_suggestion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unlike
    ADD CONSTRAINT unlike_id_suggestion_fkey FOREIGN KEY (id_suggestion) REFERENCES public.person(id);


--
-- Name: unlike unlike_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unlike
    ADD CONSTRAINT unlike_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--

