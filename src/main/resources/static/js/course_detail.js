document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('carousel');
  if (!el) return;

  const gap = 14;

  function getStep() {
    const firstCard = el.querySelector('.mc-card');
    if (!firstCard) return 0;
    const cardW = firstCard.getBoundingClientRect().width;
    return cardW + gap;
  }

  document.querySelector('.mc-btn.next').addEventListener('click', () => {
    el.scrollBy({ left: getStep(), behavior: 'smooth' });
  });

  document.querySelector('.mc-btn.prev').addEventListener('click', () => {
    el.scrollBy({ left: -getStep(), behavior: 'smooth' });
  });
});