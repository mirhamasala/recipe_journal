const setActiveColor = () => {
  const activeColor = JSON.parse(localStorage.getItem('activeColor')) || 'light';

    const switchMode = document.querySelector('#js-color-mode');

    if (activeColor === 'dark') {
      switchMode.classList.remove('light');
      switchMode.classList.add('dark');
      document.documentElement.style.setProperty('--text-color', 'var(--white)')
      document.body.style.backgroundImage = `url(${switchMode.dataset.dark}?${new Date().getTime()})`;
    } else {
      switchMode.classList.add('light');
      switchMode.classList.remove('dark');
      document.documentElement.style.setProperty('--text-color', 'var(--black)')
      document.body.style.backgroundImage = `url(${switchMode.dataset.light}?${new Date().getTime()})`;
    }
}

export { setActiveColor }