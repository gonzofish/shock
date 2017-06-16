defmodule Vestibulum.Scaffold do
  def initialize do
    File.write "./site.yml", _site_yml()
    do_generate_src()
    do_generate_themes()
  end

  defp _site_yml do
    """
    description: A new site by me, generated with Vestibulum!
    title: My New Site
    url: http://new-site.com
    """
  end

  defp do_generate_src do
    File.mkdir "./src"
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
    File.write "./themes/default/assets/styles/main.scss", ""
    File.write "./themes/default/layout/index.eex", ""
    File.write "./themes/default/layout/page.eex", ""
    File.write "./themes/default/layout/post.eex", ""
  end
end