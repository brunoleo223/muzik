var user = {
    'id': 3,
    'name': 'kamila',
    'age': 26,
    'email': 'kamila@gmail.com',
    'city': 'São Paulo',
    'gender': 'F'
}

var myInit = { method: 'GET',
               mode: 'cors',
               cache: 'default' };

var count = 0;

fetch('http://127.0.0.1:5002/api/recommendation?id=3&type=1', myInit)
.then(response => response.json())
.then(suggestions => {
    suggestion = suggestions[0]
    $('#add-info').append(`<div class="result result_surprise" id="result1">
                                <div class="head">
                                    <div class="covers">
                                        <div class="cover" style="background-image: url('assets/img/music_cover.png');">
                                            <div class="up_down_volt">
                                                <div class="down"><span>‹</span></div>
                                                <div class="up"><span>›</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="music_information">
                                        <div class="loader">
                                            <svg id="wave" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 38.05">
                                                <title>Audio Wave</title>
                                                <path id="Line_1" data-name="Line 1" d="M0.91,15L0.78,15A1,1,0,0,0,0,16v6a1,1,0,1,0,2,0s0,0,0,0V16a1,1,0,0,0-1-1H0.91Z"/>
                                                <path id="Line_2" data-name="Line 2" d="M6.91,9L6.78,9A1,1,0,0,0,6,10V28a1,1,0,1,0,2,0s0,0,0,0V10A1,1,0,0,0,7,9H6.91Z"/>
                                                <path id="Line_3" data-name="Line 3" d="M12.91,0L12.78,0A1,1,0,0,0,12,1V37a1,1,0,1,0,2,0s0,0,0,0V1a1,1,0,0,0-1-1H12.91Z"/>
                                                <path id="Line_4" data-name="Line 4" d="M18.91,10l-0.12,0A1,1,0,0,0,18,11V27a1,1,0,1,0,2,0s0,0,0,0V11a1,1,0,0,0-1-1H18.91Z"/>
                                                <path id="Line_5" data-name="Line 5" d="M24.91,15l-0.12,0A1,1,0,0,0,24,16v6a1,1,0,0,0,2,0s0,0,0,0V16a1,1,0,0,0-1-1H24.91Z"/>
                                                <path id="Line_6" data-name="Line 6" d="M30.91,10l-0.12,0A1,1,0,0,0,30,11V27a1,1,0,1,0,2,0s0,0,0,0V11a1,1,0,0,0-1-1H30.91Z"/>
                                                <path id="Line_7" data-name="Line 7" d="M36.91,0L36.78,0A1,1,0,0,0,36,1V37a1,1,0,1,0,2,0s0,0,0,0V1a1,1,0,0,0-1-1H36.91Z"/>
                                                <path id="Line_8" data-name="Line 8" d="M42.91,9L42.78,9A1,1,0,0,0,42,10V28a1,1,0,1,0,2,0s0,0,0,0V10a1,1,0,0,0-1-1H42.91Z"/>
                                                <path id="Line_9" data-name="Line 9" d="M48.91,15l-0.12,0A1,1,0,0,0,48,16v6a1,1,0,1,0,2,0s0,0,0,0V16a1,1,0,0,0-1-1H48.91Z"/>
                                            </svg>
                                        </div>
                                        <div>
                                            <div class="title">Astroworld</div>
                                            <div class="artist">Travis Scott</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="infos">
                                    <div class="photo_user">
                                        <img src="assets/img/${suggestion.image}.png">
                                    </div>
                                    <div>
                                        <div class="name">${suggestion.name}</div>
                                        <div class="description">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis quam, odio amet ea ut autem dolorum natus commodi aliquam nam molestiae ducimus soluta temporibus eveniet? Aut nesciunt blanditiis voluptate neque!
                                        </div>
                                        <ul>
                                            <li><img src="assets/img/profile_ico_location.png" alt="">  <span>São Paulo, SP</span></li>
                                            <li><img src="assets/img/profile_ico_age.png" alt="">  <span>${suggestion.age} anos</span></li>
                                            <li><img src="assets/img/profile_ico_music.png" alt="">  <span>125 músicas</span></li>
                                        </ul>
                                    </div>
                                </div>
                                
                                <div class="interaction">
                                    <div class="secondary"><img src="assets/img/card_ico_star.png" alt=""></div>
                                    <div class="primary letsRock" data-id="1"><img src="assets/img/card_ico_rock.png" alt=""></div>
                                    <div class="secondary letsReject"  data-id="1"><img src="assets/img/card_ico_close.png" alt=""></div>
                                </div>
                            </div>
    `);    
});