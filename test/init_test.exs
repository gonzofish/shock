defmodule InitTests do
  use ExUnit.Case, async: false

  setup do
    File.cd(System.tmp_dir)
    Vestibulum.Scaffold.initialize

    on_exit fn -> TestHelper.cleanup end
  end

  test "should create a site.yml file" do
    assert File.exists? "./site.yml"

    { :ok, contents } = File.read "./site.yml"
    assert contents ==
    """
    description: A new site by me, generated with Vestibulum!
    language: en
    title: My New Site
    url: http://new-site.com
    """
  end

  test "should generate content directory" do
    assert File.dir? "./content"
  end

  test "should generate a themes directory with the default theme in it" do
    template_dirs = ~w(
      ./themes/default/assets/images
      ./themes/default/assets/js
      ./themes/default/assets/styles
      ./themes/default/layout
    )
    template_files = ~w(
      ./themes/default/assets/styles/main.scss
      ./themes/default/layout/base.eex
      ./themes/default/layout/index.eex
      ./themes/default/layout/page.eex
      ./themes/default/layout/post.eex
    )

    Enum.each(template_dirs, fn(dir) -> File.dir?(dir) |> assert end)
    Enum.each(template_files, fn(file) -> File.exists?(file) |> assert end)
  end

  test "should create the default base.eex template" do
    { :ok, contents } = File.read "./themes/default/layout/base.eex"
    assert contents ==
    """
    <!DOCTYPE html>
    <html lang="<%= @language %>">
        <head>
            <title><%= @title %></title>

            <meta name="charset" content="utf8">
            <meta name="description" content="<%= @description %>">

            <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
            <%= @styles %>
        </head>

        <body>
            <div class="container">
              <h1><%= @title %></h1>
              <%= @content %>
            </div>

            <%= @scripts %>
        </body>
    </html>
    """
  end

  test "should create the default main.scss" do
    { :ok, contents } = File.read "./themes/default/assets/styles/main.scss"
    assert contents ==
    """
    body {
      color: black;
      font: 14px 'Open Sans', sans-serif;
    }
    div.container {
      align-content: flex-start;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      max-width: 800px;
      margin: 0 auto;
      width: 100%;

      h1 {
        font-size: 300%;
      }
    }
    """
  end
end