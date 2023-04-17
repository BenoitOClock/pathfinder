// Fonction pour la page trek
// La partie droite (avec les photos) fait la taille de la partie gauche (avec le texte)
function adjustMainRightHeight() {
  if (window.innerHeight > 1200) {
    const leftHeight = document.querySelector('.trek_main-text').clientHeight;
    document.querySelector('.trek_main_photos').style.height = leftHeight + 'px';
  }
}

// Au 1er chargement de la page 
if (window.innerWidth > 1200) {
  window.addEventListener('load', adjustMainRightHeight);
  window.addEventListener('resize', adjustMainRightHeight);
}

// Des que la fenêtre est redimensionnée
window.addEventListener('resize', function() {
  if (window.innerWidth > 1200) {
    window.addEventListener('load', adjustMainRightHeight);
    window.addEventListener('resize', adjustMainRightHeight);
  } else {
    window.removeEventListener('load', adjustMainRightHeight);
    window.removeEventListener('resize', adjustMainRightHeight);
  }
});


// == == //
// Menu burger du header
let sidenav = document.getElementById("mySidenav");
let openBtn = document.getElementById("openBtn");
let closeBtn = document.getElementById("closeBtn");

openBtn.onclick = openNav;
closeBtn.onclick = closeNav;

function openNav() {
  sidenav.classList.add("active");
}
function closeNav() {
  sidenav.classList.remove("active");
}


// == == //
// Fonction pour positionner le footer en fixed/bottom 0 si la page fait moins de la hauteur de l'écran
function footerPosition() {
  const footer = document.querySelector('footer');        // Element <footer>
  const pageHeight = document.body.scrollHeight;          // Taille de la page totale (avec le scroll)
  const windowHeight = window.innerHeight;                // Taille de la fenêtre
  if (pageHeight <= windowHeight) {                       // Si la taille du scroll est inférieur ou égale à la taille de la fenêtre
    footer.style.position = 'fixed';                      // On positionne le footer en fixed et bottom 0
    footer.style.bottom = '0';
  }
};
window.addEventListener('load', footerPosition);


// == == //
// Fonction pour aggrandir les images dans un modal
// Récupérez toutes les balises d'image dans un tableau
const images = document.getElementsByClassName('photo-link');

// Parcourir le tableau et ajoutez un gestionnaire d'événements de clic à chaque image
for (let i = 0; i < images.length; i++) {
  images[i].addEventListener('click', function(e) {
    e.preventDefault();
    const src = this.parentNode.getAttribute('href'); // La source de la photo est la source de la boucle

    // Définissez la source de l'image agrandie dans la boîte de dialogue modale
    document.getElementById('modal-image').setAttribute('src', src);

    // Afficher la boîte de dialogue modale
    document.getElementById('myModal').style.display = "block";
  });
}

// Pour fermer l'aggrandissement de la photo, on click nimporte ou en dehors de la photo
// Ajoutez un gestionnaire d'événements de clic à l'élément de fond de la boîte de dialogue modale
const modalBackgroundElement = document.getElementById('modal-background')
if (modalBackgroundElement !== null) {
modalBackgroundElement.addEventListener('click', function() {
  document.getElementById('myModal').style.display = "none";
});
}

// Gestion des inputs radio / checkbox
const radioInputs = document.querySelectorAll('[slot="radio"]');
// Récupérer tous les boutons radio dans une variable
const checkboxInputs = document.querySelectorAll('[slot="checkbox"]');
// Récupérer tous les boutons checkbox dans une variable
const allInputs = [...radioInputs, ...checkboxInputs];

// == Fonction recherche par Tag == //
// Récupérer tous les treks dans une variable
let allTreks = document.querySelectorAll('.trek-home');

function filterTreksByTag() {
  // == Récupérer les tags sélectionnés
  const selectedTags = Array.from(allInputs)
    // On transforme le nodeList en tableau avec Array.from
    .filter(input => input.checked)
    // On filtre le tableau pour ne garder que les inputs qui sont cochés
    .map(input => input.getAttribute('value'))
    // On récupère la valeur de chaque input
    
  // == Filtrer les treks par les tags sélectionnés
  let filteredTreks = [...allTreks];
  // On copie le tableau allTreks dans filteredTreks
  
  if (selectedTags.length > 0) {
    // Si au moins un tag est sélectionné
    filteredTreks = filteredTreks.filter(trek =>
    // On filtre le tableau filteredTreks pour ne garder que les treks qui ont les tags sélectionnés
      selectedTags.every(tag => trek.dataset.setTag.split(' ').includes(tag))
      // Le dataset permet de récupérer les données personnalisées de l'élément 
      // Le split permet de transformer le string en tableau, sinon pour 13 il y aura les tags 13 mais aussi 1 et 3.
      );
  }

  // == Mettre à jour l'affichage des treks
  const treksContainer = document.querySelector('.container-treks');
  // Récupérer le conteneur des treks
  treksContainer.innerHTML = '';
  // Vider le conteneur des treks

  if (filteredTreks.length === 0) {
    // Si aucun trek ne correspond aux tags sélectionnés
    const noTrek = document.createElement('div');
    // Créer un élément div
    noTrek.classList.add('no-trek');
    // Ajouter une classe à l'élément
    noTrek.innerHTML = 'Aucune sortie ne correspond à votre recherche';
    // Ajouter du contenu à l'élément
    treksContainer.appendChild(noTrek);
    // Ajouter l'élément au conteneur des treks
  } else {
  filteredTreks.forEach(trek => {
    treksContainer.appendChild(trek);
    // Pour chaque trek dans la variable filteredTreks, on ajoute le trek au conteneur des treks
  });
}
}


// Ajouter un écouteur d'événement sur chaque input radio
allInputs.forEach(input => {
  input.addEventListener('change', () => {
    filterTreksByTag();
    // Quand l'input change de statut, on appelle la fonction filterTreksByTag
    footerPosition();
  });
});


// Appeler filterTreksByTag lorsque la page est chargée
window.addEventListener('load', filterTreksByTag);
// Quand la page est chargée, on appelle la fonction filterTreksByTag
// Ce qui a pour effet de garder les cases cochées et la sélection des treks