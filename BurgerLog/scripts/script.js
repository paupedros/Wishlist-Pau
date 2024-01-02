$(document).ready(function () {

    // Show Burger Details
    $("body").on("click", ".button", function () {
        // Busquem l'element .details que esta directament amb el boto que hem fet click
        var detailElement = $(this).siblings(".detail");
        var cardElement = $(this).closest(".card");

        // Toggle del element .details
        detailElement.toggle();
        // Tranformar tamany del .card
        cardElement.css("max-height", "fit-content");
        console.log("showed details");
        // Amaguem els altres elements .details
        $(".detail").not(detailElement).css("display", "none");
        $(".card").not(cardElement).css("max-height", "330px");

    });

    // Afegir el símbol de l'euro a burgerPrice
    $(".burgerPrice").each(function () {
        // Obtenir el contingut de text actual
        var priceText = $(this).text();

        // Afegir el símbol de l'euro al text
        $(this).text(priceText + "€");
    });

    // Manejar el evento input para actualizar la vista previa cuando cambia cualquier campo del formulario
    $("form input, form select, form textarea").on("input", function () {
        updatePreview();
    });

    function updatePreview() {
        // Obtener los valores del formulario
        var burgerName = $("#burgerName").val();
        var burgerType = $("#burgerType option:selected").text();
        var burgerPrice = $("#burgerPrice").val();
        var burgerRestaurant = $("#sectionBurgerRestaurant input[name='burgerRestaurant']").val();
        var burgerImage = $("#burgerImage").val(); // Aquí puedes obtener la URL de la imagen si la has subido
        var burgerRating = $(".rating").val();
        var burgerIngredients = $("#burgerIngredients").val();

        // Generar las estrellas de la calificación
        var stars = generateStars(burgerRating);

        // Crear la estructura de la .card de vista previa
        var previewCard = $("<div class='card'>" +
            "<div class='cardTop'>" +
            "<div class='burgerName'>" + burgerName + "</div>" +
            "<div class='burgerRating'>" + stars + "</div>" +
            "</div>" +
            "<div class='cardTop2'>" +
            "<div class='restaurantName'><em>" + burgerRestaurant + "</em></div>" +
            "<div class='burgerPrice'>" + burgerPrice + " €</div>" +
            "</div>" +
            "<div class='burgerImage'>" +
            "<img src='" + burgerImage + "' alt='" + burgerName + "' loading='lazy'>" +
            "</div>" +
            "<div class='burgerDetails'>" +
            "<button class='button' >View Details</button>" +
            "<div class='detail'>" +
            "<div class='burgerType'><p><em>" + burgerType + "</em></p></div>" +
            "<p>Ingredients</p>" +
            "<em>" + burgerIngredients + "</em>" +
            "</div>" +
            "</div>" +
            "</div>");

        // Limpiar el artículo de vista previa y agregar la nueva vista previa
        $("#burgerPreview").html(previewCard);
    }

    // Codi per generar les estrelles
    function generateStars(rating) {
        var stars = "";
        for (var i = 1; i <= 5; i++) {
            if (i <= Math.floor(rating)) {
                stars += "<i class='fa-solid fa-star star'></i>";
            } else if (i - 0.5 <= rating) {
                stars += "<i class='fa-solid fa-star-half-stroke'></i>";
            }
        }
        return stars;
    }

});

