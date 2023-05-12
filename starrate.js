function createStarRate(rate) {
    var temp = Math.round(rate * 2) / 2;
    var starRate = document.createElement("div");
    for (let i = 0; i < Math.floor(temp); i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star");
        starRate.appendChild(starElement);
    }
    if (temp % 1 !== 0) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-half-o");
        starRate.appendChild(starElement);
    }
    for (let i = 0; i < 5 - Math.ceil(temp); i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-o");
        starRate.appendChild(starElement);
    }
    return starRate;
}
