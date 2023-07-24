# Dynamic E-commerce Platform with React.js and Strapi

This project is an e-commerce platform developed using React.js for the front end and Strapi for the back end. The data is managed using a MySQL database, and design elements have been implemented using Sass, giving the interface a visually pleasing and functional aesthetic which is also responsive to all screen sizes.

The primary feature of the application is the product page, which provides an extensive display of product information - including descriptions, images, and pricing. Products are further organized into categories and subcategories for better user navigation.

An attention-grabbing feature is the automatic slider that updates every seven seconds. Coupled with a navigational bar and dedicated tabs for featured and trending posts.

The platform also includes dynamic pricing functions. Discounts can be set on products, or badges can be added to denote new items.

One essential feature is the shopping cart system, allowing users to manage their product selections conveniently. The integration of Strapi, a headless CMS, supports efficient content management on the platform, permitting the addition, editing, or deletion of items, categories, subcategories and variable tags.

![Desktop Demo](http://www.oktayshakirov.com/assets/images/projects/watch_store.png "Desktop Demo")

<p align="center">
  <a href="https://timeazon.netlify.app/"><strong>➥ Live Demo</strong></a>
</p>

## Installation

Before you start, ensure you have Node.js and npm or yarn installed on your system. If not, you can download Node.js and npm from [here](https://nodejs.org/) and yarn from [here](https://yarnpkg.com/).

### Step 1: Clone the Repository

Start by cloning the repository to your local machine. You can do this by running the following command in your terminal:

```bash
git clone https://github.com/oktayshakirov/online-store.git
```

### Step 2: Navigate to the Directory

Navigate into the cloned repository's directory:

```bash
cd online-store
```

### Step 3: Install Dependencies for React App

Install the necessary dependencies for the React app:

```bash
npm install
```

or

```bash
yarn install
```

### Step 4: Connecting your database to the environment

Create a file .env in the main folder of your application

```bash
# Local Server Configuration

VITE_APP_API_TOKEN=*Place your API key generated py Strapi here*
VITE_APP_API_URL=http://localhost:1337/api
VITE_APP_UPLOAD_URL=http://localhost:5173/api/public
```

```bash
# # Remote Server Configuration

VITE_APP_API_TOKEN=*Place your API key generated py Strapi here*
VITE_APP_API_URL=*Your server URL*
VITE_APP_UPLOAD_URL=http://*server URL*/api/public
```

You can also fetch the images for the products locally

```bash
VITE_APP_UPLOAD_URL=/Watches
```

### Step 5: Navigate to the API Directory

Navigate to the Strapi app, which is in the /api directory within the project:

```bash
cd api
```

### Step 6: Install Dependencies for Strapi App

Install the necessary dependencies for the Strapi app:

```bash
npm install
```

or

```bash
yarn install
```

### Step 7: Setup Strapi

Follow the instructions in the Strapi documentation to set up your Strapi CMS. You will need to create an .env file in the root of your Strapi directory (/api) and add your database connection string and other environment-specific variables.

To start the React app, navigate to its directory and run:

```bash
npm start
```

or

```bash
yarn start
```

To start the Strapi app, navigate to its directory (/api) and run:

```bash
npm start
```

or

```bash
yarn start
```

### Step 8: Connecting your database to Strapi

Create .env file in /api and set it accordingly to your database

```bash
HOST=0.0.0.0
PORT=1337
APP_KEYS=
API_TOKEN_SALT=
ADMIN_JWT_SECRET=
TRANSFER_TOKEN_SALT=
# Database
DATABASE_CLIENT=mysql
DATABASE_HOST=127.0.0.1
DATABASE_PORT=3306
DATABASE_NAME=watch_store
DATABASE_USERNAME=
DATABASE_PASSWORD=
DATABASE_SSL=false
JWT_SECRET=
```

Now, you should be able to access the application at http://localhost:3000.

![Desktop Demo](https://raw.githubusercontent.com/oktayshakirov/online-store/main/public/demo_admin.png "Desktop Demo")

### Deployment

The deployment process may vary depending on your hosting provider. Please refer to the specific documentation provided by your hosting service for the deployment process.

### Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

### MIT

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

- Translation: Ofcourse you can use this for you project! Just make sure to say where you got this from :)

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
