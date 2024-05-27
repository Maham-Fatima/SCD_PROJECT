document.addEventListener('DOMContentLoaded', function() {
//github button
document.getElementById("gh").addEventListener('click', function (event) {
    console.log(document.getElementsByClassName("git")[0].getAttribute("href"));
    window.open("https://github.com/Maham-Fatima", '_blank')
});
//linkedin button
document.getElementById("l").addEventListener('click', function (event) {
    window.open("https://www.linkedin.com/in/maham-fatima-517a98284/", '_blank')
});
//gmail
document.getElementById("g").addEventListener('click', function (event) {
    window.open("mailto:fmaham599@gmail.com", '_blank')
});
});
