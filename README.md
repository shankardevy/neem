# Neem

This project demonstrates how to build a mini-web framework from scratch in Elixir.

The intention of this project is to learn the internals of Phoenix Framework and the various steps involved in the request/response cycle. The code in this repo is fully explained step by step in my book [Garuda](http://shankardevy.com/phoenix-book/).


## Setup

```
git clone https://github.com/shankardevy/neem.git

cd neem

mix deps.get

iex -S mix
```

Now visit http://localhost:5000

## What does this project do?
It just displays a Hello world message. But to get there, the project uses a minimal MVC created from scratch and uses Elixir's meta programming stuff to create DSL for router. If you are familiar with Elixir and can read meta-programming you can see how the code works by just looking at the various commits. Or if you want to learn this stuff and need some handholding in the process, you might want to buy the book and follow along step by step.

## Why is this useful?
Knowing how a framework works internally is a very special knowledge that can change the way you work with Phoenix.

Writing this project already helped me to understand the various parts of Phoenix and I started appreciating the framework much better because I now know how to read its source code and see the meta-programming magic. In the process, I also learned to do advanced tweaks to my Phoenix projects.

I am sure this will bring the same benefit to anyone who tries to rebuild Phoenix.
