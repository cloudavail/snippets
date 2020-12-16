loadImage('2560px-Lama_glama_Laguna_Colorada_2.jpg',
    function onsuccess(img) {
        // Add the image to the current web page
        document.body.appendChild(img);
    },
    function onerror(e) {
        console.log('Error occurred while loading image');
        console.log(e);
    }
);

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
