function createStarRate(rate) {
    var starRate = document.createElement("div");
    for (let i = 0; i < rate - 0.5; i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star");
        starRate.appendChild(starElement);
    }
    if (rate % 1 !== 0) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-half-o");
        starRate.appendChild(starElement);
    }
    for (let i = 0; i < 4.5 - rate; i++) {
        const starElement = document.createElement("i");
        starElement.classList.add("fa", "fa-star-o");
        starRate.appendChild(starElement);
    }
    return starRate;
}