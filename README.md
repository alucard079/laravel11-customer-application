
# Customer Application

This project is a Customer Application built with Laravel, Inertia.js, and Vue.js. It allows writers to create and edit customers.

## Features

- Customer Management
- Login
- Logout


## Installation

Follow the steps below to set up the project locally.
Prerequisites

Ensure you have the following installed:
- PHP >= 8.2
- Composer
- Node.js & npm
- MySQL
- Docker
  
1. Clone the Repository
```bash
  https://github.com/alucard079/laravel11-customer-application.git
  cd laravel11-customer-application
```
2. Run Docker
```bash
  docker-compose -d --build
  docker exec -it customer-application-app bash
```
3. Install PHP Dependencies
```bash
  composer install
  npm install
```
4. Set Up the .env File
```bash
  cp .env.example .env
```
5. Generate the Application Key
```bash
  php artisan key:generate
```
6. Run Database Migrations and Seeders
```bash
  php artisan migrate
  php artisan db:seed
```
7. Running the Project Locally
```bash
  composer run dev
```
    
## Tech Stack

**Client:** VueJS, HTML, CSS, TailwindCSS, DaisyUI

**Server:** PHP, Laravel, Inertia JS, MySQL, Docker


## License

[MIT](https://choosealicense.com/licenses/mit/)

