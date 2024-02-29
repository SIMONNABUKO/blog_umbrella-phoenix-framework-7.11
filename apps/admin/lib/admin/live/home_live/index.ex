defmodule Admin.Live.HomeLive.Index do
  use Admin, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
