const activateToggleLightDarkMode = () => {
  const lightDarkSwitch = document.querySelector("#js-light-dark-mode");

  const toggleLightDarkMode = (event) => {
    event.preventDefault();
    if (event.currentTarget.classList.contains("light-mode")) {
      event.currentTarget.classList.remove("light-mode");
      event.currentTarget.classList.add("dark-mode");
      document.documentElement.style.setProperty("--text-color", "var(--white)")
      document.body.style.backgroundImage = `url(${event.currentTarget.dataset.dark})`;
    } else {
      event.currentTarget.classList.add("light-mode");
      event.currentTarget.classList.remove("dark-mode");
      document.documentElement.style.setProperty("--text-color", "var(--black)")
      document.body.style.backgroundImage = `url(${event.currentTarget.dataset.light})`;
    }
  }
  lightDarkSwitch.addEventListener("click", toggleLightDarkMode);
}

export { activateToggleLightDarkMode };
