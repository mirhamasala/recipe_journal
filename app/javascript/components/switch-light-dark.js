const activateSwitchLightDarkMode = () => {
  const lightDarkSwitch = document.querySelector("#js-light-dark-mode");
  const lightDarkIcon = document.querySelector("#js-light-dark-icon");

  const switchLightDarkMode = (event) => {
    event.preventDefault();
    if (event.currentTarget.classList.contains("light-mode")) {
      event.currentTarget.classList.remove("light-mode");
      event.currentTarget.classList.add("dark-mode");
      document.documentElement.style.setProperty("--text-color", "var(--white)")
      document.body.style.backgroundImage = `url(${event.currentTarget.dataset.dark})`;
      lightDarkIcon.src = lightDarkIcon.dataset.yoda;
    } else {
      event.currentTarget.classList.add("light-mode");
      event.currentTarget.classList.remove("dark-mode");
      document.documentElement.style.setProperty("--text-color", "var(--black)")
      document.body.style.backgroundImage = `url(${event.currentTarget.dataset.light})`;
      lightDarkIcon.src = lightDarkIcon.dataset.vader;
    }
  }
  lightDarkSwitch.addEventListener("click", switchLightDarkMode);
}

export { activateSwitchLightDarkMode };
