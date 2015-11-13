var popup = document.getElementById('popup');
var biasCard = document.getElementById('biasCard');
var openBiasCardButton = document.getElementById('seeBiasButton');

// Removing 'hidden' from biasCard's class name. Hidden is a proprietary bootstrap thing that hides the element (wow!)
openBiasCardButton.onclick = function() {
 biasCard.className = 'col-md-4 biasCard';
}

$('#testButton').click(function() {

  popup.style.display = 'block';

});
