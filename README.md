# Liquid-CLI

A command-line wrapper over the [liquid][] ruby library by Shopify.

[liquid]: https://github.com/Shopify/liquid

## Installation

    $ gem install liquid-cli

## Usage

Supply a template on `stdin` and an optional context as JSON.

    $ echo 'Hi, my name is {{ name }}.' | liquid '{ "name": "Pat" }'
    Hi, my name is Pat.

Use shell redirection to make handling larger templates and contexts 
easier:

    $ cat context.json
    {
      "title": "A title",
      "posts": [
        {
          "link": "/posts/foo",
          "content": "Foo"
        },
        {
          "link": "/posts/bar",
          "content": "Bar"
        }
      ]
    }

    $ liquid "$(< context.json)" <<EOF
    <h1>{{ title }}</h1>
    {% for post in posts %}
      <a href="{{ post.link }}">{{ post.content }}</a>
    {% endfor %}
    EOF
