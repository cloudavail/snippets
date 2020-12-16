var promise = loadImage('2560px-Lama_glama_Laguna_Colorada_2.jpg');

promise.then(function (img) {
    document.body.appendChild(img);
});

promise.catch(function (e) {
    console.log('Error occurred while loading image');
    console.log(e);
});

function loadImage(url, success, error) {
    var img = new Image();
    img.src = url;

    img.onload = function () {
        success(img);
    };

    img.onerror = function (e) {
        error(e);
    };
}
