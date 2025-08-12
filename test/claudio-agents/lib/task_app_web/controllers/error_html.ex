defmodule TaskAppWeb.ErrorHTML do
  @moduledoc """
  This module is invoked by Phoenix whenever an error occurs that needs to be rendered.
  """
  use TaskAppWeb, :html

  # If you want to customize a particular status code, you may add your own function.
  # You can also template status codes by adding files to the templates directory.
  #
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from the template name.
  # For example, "404.html" becomes "Not Found".
  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end