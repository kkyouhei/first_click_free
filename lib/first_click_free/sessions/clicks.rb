class Clicks
  @session = {}

  def initialize session
    key = first_click_free_of_session_key
    session["first_click_free"] = session["first_click_free"] || {}
    session[key] = session[key] || {key => {}}
    @session = session
  end

  def first_click
    key = first_click_free_of_session_key
    @session["first_click_free"][key]["first_click"]
  end

  def first_click= first_click
    key = first_click_free_of_session_key
    @session["first_click_free"] = {key => {"first_click" => first_click}}
  end

  private
    def first_click_free_of_session_key
      Date.today.strftime("%Y%m%d")
    end
end
