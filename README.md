<p align="center">An unofficial implementation of Prodigi.com REST API <code>v4</code> in 👑 Nim language.</p>

## 😍 Key Features
- [x] Made with Love
- [x] Live and Sandbox Enviroment
- [x] HTTP Request via Nim's native HTTP Library
- [x] Zero Dependencies except [Nyml](https://github.com/openpeep/nyml) for its yEnv functionality
- [x] Open Source under `MIT` License

## Endpoints
- [ ] Environments
- [ ] Authentication Header
- [ ] Orders
- [ ] Order Actions
- [ ] Quotes
- [ ] Product details
- [ ] Callbacks

Prodigi is an awesome Print on Demand company based in UK and other EU countries. [Check Prodigi.com](https://prodigi.com) website and [Prodigi's Portfolio](https://www.prodigi.com/download/product-range/prodigi-portfolio.pdf). [Check official API Documentation](https://www.prodigi.com/print-api/).

## Prodigi's Live and Sandbox Environments
Prodigi provides two working environments. One for production (Live) and one for development purpose, called Sandbox. By default Prodigi Client is running with `sandbox` set `true`, which will route all requests to `api.sandbox.prodigi.com`, whereas for production environment the base endpoint is `api.prodigi.com`. Read about [Sandbox / Live environments](https://www.prodigi.com/print-api/docs/reference/#environments-sandbox).

## Quick Example
```python
import prodigi

var client = Prodigi()
```


### The order process
Understanding how Prodigi process and fulfill orders will help you understand their API. Prodigi's order process consists of the following steps:
1. Order creation
2. Assets download
3. Lab allocation
4. Asset preparation
5. Lab submission
6. Production
7. Shipping
8. Order completion

Check official [documentation related to Order Process](https://www.prodigi.com/print-api/docs/reference/#the-order-process)



### ❤ Contributions
If you like this project you can contribute by opening new issues, fixing bugs, contribute with code, ideas and you can even support us via PayPal address pay@openpeep.ro

### 👑 Discover Nim language
<strong>What's Nim?</strong> Nim is a statically typed compiled systems programming language. It combines successful concepts from mature languages like Python, Ada and Modula. [Find out more about Nim language](https://nim-lang.org/)

<strong>Why Nim?</strong> Performance, fast compilation and C-like freedom. We want to keep code clean, readable, concise, and close to our intention. Also a very good language to learn in 2022.

### 🎩 License
Prodigi Nim is an Open Source Software released under `MIT` license. Developed by Humans from [OpenPeep](https://github.com/openpeep).<br>
Copyright &copy; 2022 OpenPeep & Contributors &mdash; All rights reserved.
