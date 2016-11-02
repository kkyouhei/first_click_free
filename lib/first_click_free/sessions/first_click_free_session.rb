class FirstClickFreeSession
  def initialize session
    key = first_click_free_of_session_key
    if session["first_click_free"].blank? || session["first_click_free"][key].blank?
      session["first_click_free"] = {key => {}}
    end
    @clicks = session["first_click_free"][key]["first_click"] || []
    @session = session
  end

  def clicks
    @clicks
  end

  def clicks=(click)
    add -> { @clicks = click }
  end

  def <<(click)
    add -> { @clicks << click }
  end

  private
    def add operation
      key = first_click_free_of_session_key
      operation.call
      @session["first_click_free"][key] = {"first_click" => @clicks}
    end

    def first_click_free_of_session_key
      Date.today.strftime("%Y%m%d")
    end
end
