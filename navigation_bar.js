function createNavigationBarElements() {
    // Tạo phần tử div chứa thanh điều hướng
    const navigationBar = document.createElement('div');
    navigationBar.classList.add('navigation_bar');

    // Tạo phần tử div chứa logo
    const logoContainer = document.createElement('div');
    logoContainer.classList.add('logo');
    const logoImg = document.createElement('img');
    logoImg.src = 'pics/logo2.png';
    logoImg.alt = '';
    logoImg.style.width = '150px';
    logoContainer.appendChild(logoImg);

    // Tạo phần tử form chứa ô tìm kiếm
    const searchForm = document.createElement('form');
    searchForm.action = './';
    searchForm.method = 'get';
    const searchbarContainer = document.createElement('div');
    searchbarContainer.classList.add('searchbar');
    const searchbarInput = document.createElement('input');
    searchbarInput.type = 'text';
    searchbarInput.classList.add('searchbar_input');
    searchbarInput.name = 'search';
    searchbarInput.placeholder = 'Search Books';
    const searchbarButton = document.createElement('button');
    searchbarButton.type = 'submit';
    searchbarButton.classList.add('searchbar_button');
    const searchbarIcon = document.createElement('i');
    searchbarIcon.classList.add('material-icons');
    searchbarIcon.textContent = 'search';
    searchbarButton.appendChild(searchbarIcon);
    searchbarContainer.appendChild(searchbarInput);
    searchbarContainer.appendChild(searchbarButton);
    searchForm.appendChild(searchbarContainer);

    // Tạo phần tử nav chứa danh sách liên kết
    const navigationLinks = document.createElement('nav');
    const linkList = document.createElement('ul');
    const linkItems = ['Home', 'Genres', 'Contact', 'About', 'Log In'];
    const linkUrls = ['index', 'genres', 'contact', 'about', 'login'];

    linkItems.forEach((linkItem, index) => {
        const listItem = document.createElement('li');
        listItem.classList.add('nav_bar');
        const link = document.createElement('a');
        link.href = `${linkUrls[index]}.html`;
        link.textContent = linkItem;
        listItem.appendChild(link);
        linkList.appendChild(listItem);
    });

    navigationLinks.appendChild(linkList);

    // Thêm các phần tử vào thanh điều hướng
    navigationBar.appendChild(logoContainer);
    navigationBar.appendChild(searchForm);
    navigationBar.appendChild(navigationLinks);

    return navigationBar;
}

function createNavigation() {
    const navigation = document.querySelector('.navigation_bar');

    if (navigation) {
        const navigationBarElements = createNavigationBarElements();
        navigation.appendChild(navigationBarElements);
    }
}

// Gọi hàm để tạo thanh điều hướng
document.addEventListener('DOMContentLoaded', createNavigation);