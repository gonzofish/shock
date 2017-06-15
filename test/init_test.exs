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
    assert contents === 
    """
    description: A new site by me, generated with Vestibulum!
    title: My New Site
    url: http://new-site.com
    """
  end

  test "should generate source directory with index.md" do
    assert File.dir? "./src"
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
      ./themes/default/layout/index.eex
      ./themes/default/layout/page.eex
      ./themes/default/layout/post.eex
    )

    Enum.each(template_dirs, fn(dir) -> File.dir? dir |> assert end)
    Enum.each(template_files, fn(file) -> File.exists? file |> assert end)
  end
end