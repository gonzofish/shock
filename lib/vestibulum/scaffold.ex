defmodule Vestibulum.Scaffold do
  def initialize do
    File.write "./site.yml", _site_yml()
    do_generate_content()
    do_generate_themes()
  end

  defp _site_yml do
    """
    description: A new site by me, generated with Vestibulum!
    language: en
    title: My New Site
    url: http://new-site.com
    """
  end

  defp do_generate_content do
    File.mkdir "./content"
  end

  defp do_generate_themes do
    File.mkdir "./themes"
    do_generate_default_theme()
  end

  defp do_generate_default_theme do
    do_generate_default_theme_dirs()
    do_generate_default_theme_files()
  end

  defp do_generate_default_theme_dirs do
    File.mkdir "./themes/default/assets/images"
    File.mkdir "./themes/default/assets/js"
    File.mkdir_p "./themes/default/assets/styles"
    File.mkdir "./themes/default/layout"
  end

  defp do_generate_default_theme_files do
    File.write "./themes/default/assets/styles/main.scss", _default_style()
    File.write "./themes/default/layout/base.eex", _default_base()
    File.write "./themes/default/layout/index.eex", ""
    File.write "./themes/default/layout/page.eex", ""
    File.write "./themes/default/layout/post.eex", ""
  end

  defp _default_base() do
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

  defp _default_style do
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