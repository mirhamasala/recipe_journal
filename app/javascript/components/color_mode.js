import { ECONNRESET } from "constants";

const activateSwitchMode = () => {
  const switchMode = document.querySelector('#js-color-mode');

  const switchColor = (event) => {
    event.preventDefault();

    if (event.currentTarget.classList.contains('light')) {
      event.currentTarget.classList.remove('light');
      event.currentTarget.classList.add('dark');
      document.documentElement.style.setProperty('--text-color', 'var(--white)')
      document.body.style.backgroundImage = `url(${event.currentTarget.dataset.dark})`;
      localStorage.setItem('activeColor', JSON.stringify('dark'));
    } else {
      event.currentTarget.classList.add('light');
      event.currentTarget.classList.remove('dark');
      document.documentElement.style.setProperty('--text-color', 'var(--black)')
      document.body.style.backgroundImage = `url(${event.currentTarget.dataset.light})`;
      localStorage.setItem('activeColor', JSON.stringify('light'));
    }
  }

  switchMode.addEventListener('click', switchColor);

}

export { activateSwitchMode }

// item.addEventListener('click', function (event) {
//   event.preventDefault();
//   document.documentElement.style.setProperty('--background-color', event.currentTarget.dataset.background);
//   document.documentElement.style.setProperty('--text-color', event.currentTarget.dataset.text);
// })
