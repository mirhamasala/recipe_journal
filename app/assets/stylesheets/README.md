## Sizing Reference

### Type Scale

12px = 0.75rem
14px = 0.875rem
16px = 1rem (base)
18px = 1.125rem
20px = 1.25rem
24px = 1.5rem
30px = 1.875rem
32px = 2rem
36px = 2.25rem
48px = 3rem
60px = 3.75rem
72px = 4.5rem

### Spacing & Sizing

4px (16 x 0.25)
8px (16 x 0.5)
12px (16 x 0.75)
16px (16 x 1)
24px (16 x 1.5)
32px (16 x 2)
48px (16 x 3)
64px (16 x 4)
96px (16 x 6)
128px (16 x 8)
192px (16 x 12)
256px (16 x 16)
384px (16 x 24)
512px (16 x 32)
640px (16 x 40)
768px (16 x 48)

## Adding new `.scss` files

Look at your main `application.scss` file to see how SCSS files are imported. There should **not** be a `*= require_tree .` line in the file.

```scss
// app/assets/stylesheets/application.scss

// Graphical variables
@import "config/fonts";
@import "config/colors";
@import "config/bootstrap_variables";

// External libraries
@import "bootstrap/scss/bootstrap"; // from the node_modules
@import "font-awesome-sprockets";
@import "font-awesome";

// Your CSS partials
@import "components/index";
@import "pages/index";
```

For every folder (**`components`**, **`pages`**), there is one `_index.scss` partial which is responsible for importing all the other partials of its folder.

**Example 1**: Let's say you add a new `_contact.scss` file in **`pages`** then modify `pages/_index.scss` as:

```scss
// pages/_index.scss
@import "home";
@import "contact";
```

**Example 2**: Let's say you add a new `_card.scss` file in **`components`** then modify `components/_index.scss` as:

```scss
// components/_index.scss
@import "card";
```

## Navbar template

Our `layouts/_navbar.scss` code works well with our home-made ERB template which you can find here:

- [version without login](https://github.com/lewagon/awesome-navbars/blob/master/templates/_navbar_wagon_without_login.html.erb)
- [version with login](https://github.com/lewagon/awesome-navbars/blob/master/templates/_navbar_wagon.html.erb)

Don't forget that `*.html.erb` files go in the `app/views` folder, and `*.scss` files go in the `app/assets/stylesheets` folder. Also, our navbar have a link to the `root_path`, so make sure that you have a `root to: "controller#action"` route in your `config/routes.rb` file.
