const carousel = document.querySelectorAll(".feat_row");

carousel.forEach((carousel) => {

    const arrowIconsl = document.querySelectorAll(".arrows i"),
        arrowIconsr = document.querySelectorAll(".arrows1 i"),
        firstBook = carousel.querySelectorAll(".featured_img")[0];

    let isDragStart = false, prevPageX, prevScrollLeft;
    let firstBookWidth = 174 + 53;

    arrowIconsl.forEach(icon => {
        icon.addEventListener("click", () => {
            carousel.scrollLeft -= firstBookWidth;
        });
    });

    arrowIconsr.forEach(icon => {
        icon.addEventListener("click", () => {
            carousel.scrollLeft += firstBookWidth;
        });
    });

    const dragStart = (e) => {
        isDragStart = true;
        prevPageX = e.pageX;
        prevScrollLeft = carousel.scrollLeft;
    }
    const dragging = (e) => {
        if (!isDragStart) return;
        e.preventDefault();
        carousel.classList.add("dragging");
        let positionDiff = e.pageX - prevPageX;
        carousel.scrollLeft = prevScrollLeft - positionDiff;
    }

    const dragStop = () => {
        isDragStart = false;
        carousel.classList.remove("dragging");
    }
    carousel.addEventListener("mousedown", dragStart);
    carousel.addEventListener("mousemove", dragging);
    carousel.addEventListener("mouseup", dragStop);

});
