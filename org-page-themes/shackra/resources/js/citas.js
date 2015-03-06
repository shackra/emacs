// remplaza citas de escritores famosos cada cierta cantidad de segundos

// array de citas
index = 0;
var citas = [
    {autor: "Tomás de Kempis", texto: "Si alguna alegría hay en el mundo la"
     + " tiene seguramente el hombre de corazón puro"},
    {autor: "G.K. Chesterton", texto: "El matrimonio es un duelo a muerte del"
     + " cual ningún hombre de honor debe declinar"},
    {autor: "Larry Wall", texto: "La computadora debería estar haciendo el"
     + " trabajo duro. Para eso fue que se compró, después de todo"},
    {autor: "G.K. Chesterton", texto: "Lo que un hombre puede creer depende de"
     + " su filosofía, no de su reloj o del siglo"},
    {autor: "G.K. Chesterton", texto: "Cuándo un hombre realmente dice la"
     + " verdad, la primer verdad que él dice es que él mismo es un"
     + " mentiroso"},
    {autor: "G.K. Chesterton", texto: "No seas tan abierto de mente o tu"
     + " cerebro se caerá"}
];

function cambia() {
    $("#frase").fadeOut(500, function() {
        var autor = document.createElement("b");
        var autortext = document.createTextNode(" ~" + citas[index].autor);
        autor.appendChild(autortext);
        
        $(this).text("“" + citas[index].texto + "”").append(autor).fadeIn(500);
    });
    index++;
    if (index > citas.length - 1) {
        index = 0;
    }
}

$(document).ready(
    function() {
        window.setInterval(cambia, 7000);
    }
);
