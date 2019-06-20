// import 'bootstrap';
import { activateSwitchMode } from '../components/color_mode';
import { setActiveColor } from '../components/set_active_color';

activateSwitchMode();


document.addEventListener('DOMContentLoaded', (event) => {
  setActiveColor();
})