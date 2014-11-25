# HN Monitor

## Receive alerts on keywords and domains on Hacker News

This is a product being built by the Assembly community. You can help push this idea forward by visiting [https://assembly.com/hn-monitor](https://assembly.com/hn-monitor).

### How Assembly Works

Assembly products are like open-source and made with contributions from the community. Assembly handles the boring stuff like hosting, support, financing, legal, etc. Once the product launches we collect the revenue and split the profits amongst the contributors.

Visit [https://assembly.com](https://assembly.com) to learn more.

####Development
You need to have [Docker](https://www.docker.com/) and [Fig](http://www.fig.sh/) installed.

Prepare environment:
1. Build image: `fig build` (done only once, image rebuilding also needed if you need to update system packages or your Gemfile changed.
2. Initialize database: `fig run web bundle exec rake db:create db:migrate`

To start env: `fig up` <- this will run rails on 3000 port and postgres.
If you on Mac then you application port will be bind to VirtualBox IP, you can find get it here: `boot2docker ip`.

To run rake/rails tasks: `fig run web bundle exec rails g contoller Main` or `fig run web bundle exec rake routes`

####Tech Stack:
- Ruby version 2.1.2
- Rails version 4.1.6

- Authentication:
  - Devise

- Database:
  - PostgreSQL

- Testing:
  - RSpec
  - Capybara

- Server:
  - Puma

- CSS framework:
  - Bootstrap 3
  - Bootstrap SASS


