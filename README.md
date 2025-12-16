# Template-App for LogicMachine

This repository contains simple application template for **LogicMachine** <br>

files should be located <br>
/data/apps/store/data/template/index.lp <br>

## Tech Stack
- **Frontend**: Bootstrap CSS for responsive styling, Bootstrap Icons for iconography,
  and jQuery for client-side logic.
- **Backend**: Lua with NGINX for server-side logic.
- **Database**: Redis for storing notes as JSON-serialized objects.
- **Server**: NGINX for handling HTTP requests and routing.

## Project Structure

<pre style="font-family: 'Courier New', monospace; line-height: 1.2;">
template/
├── index.lp           # Main Lua Page file
├── form_validity.lp
├── knx_objects.lp
├── storage_and_redis.lp
├── api/
│   └── index.lp       # API for the app
├── bootstrap/
│   ├── bootstrap.min.css        # Bootstrap CSS
│   ├── bootstrap.bundle.min.js  # Bootstrap JavaScript
│   ├── bootstrap-icons.css      # Bootstrap Icons
│   ├── bootstrap.min.js
│   ├── popper.min.js
│   └── fonts/
│       ├── bootstrap-icons.woff  # Icons
│       └── bootstrap-icons.woff2
├── jquery/
│   ├── jquery.min.js
│   └── jquery-ui.min.js
├── core/
│   ├── form_validity.js      # jQuery client-side logic
│   ├── dropdown.js
│   ├── knx_objects.js 
│   ├── storage_and_redis.js
│   └── style.css      # Custom styles
├── lua/
│   ├── lib.lua        # backend
│   ├── init.lua
│   ├── tpl_head.lp    # header for lp files
│   └── tpl_footer.lp  # footer for lp files
└── icon.png           # icon for the app
</pre>

## Structure of index.lp

The index.lp file is divided into two main sections:

1. Lua Backend Logic (enclosed in &lt;? ... ?&gt;): Handles server-side operations.

2. HTML Frontend.



We have a [support topic in our forum](https://forum.logicmachine.net/showthread.php?tid=85) for general questions and suggestions, feel free to join.


## Credits

This project uses assets created by third parties:

*   **icon.png** created by Anja van Staden.

<details>
<summary>Show License (MIT)</summary>

```text
MIT License

Copyright (c) 2020, Anja van Staden

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

  
```
</details>