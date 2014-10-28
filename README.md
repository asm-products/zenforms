# Zenforms

## 1099 and other forms as a service

This is a product being built by the Assembly community. You can help push this idea forward by visiting [https://assemblymade.com/zenforms](https://assemblymade.com/zenforms).

### How Assembly Works

Assembly products are like open-source and made with contributions from the community. Assembly handles the boring stuff like hosting, support, financing, legal, etc. Once the product launches we collect the revenue and split the profits amongst the contributors.

Visit [https://assemblymade.com](https://assemblymade.com) to learn more.

### Tech Stack

#### Core
- Rails 4.1.6
- Postgres
- [react.js](http://facebook.github.io/react/)
- Twitter Bootstrap 3

#### Cloud Services
- Airbrake
- New Relic
- Stripe or Braintree (first $50K no fees) for one-time or subscription payments
- [Lob](https://www.lob.com/) for printing of forms

#### Server-side
- Unicorn
- Heroku deployment
- Sidekiq for emails, checking accounts, and possibly generating or processing PDF forms
- MemCachier / dalli for caching

#### Specific Technologies

- [PDF.js](http://mozilla.github.io/pdf.js/) for parsing and rendering PDFs.  Based on initial research, fill-able PDF forms are difficult to handle (also for security concerns).  Some JS trickery with HTML input overlays is likely best.  After the user input is captured, the PDFs can be rendered precisely in the background.

#### Troubleshooting
- Capybara Webkit requires [Qt to be installed](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit). If you are getting a gem installation error for `capabara-webkit`, please check to make sure Qt is installed on your machine.
