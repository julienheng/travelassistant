if @companion.persisted?
   json.form render(partial: "companions/add_field", formats: :html, locals: {
     trip: @trip, companion: Companion.new })
   json.inserted_item render(partial: "companions/companion_field", formats: :html,
     locals: { companion: @companion })
  json.saved "success"
else
  json.form render(partial: "companions/add_field", formats: :html, locals: { trip: @trip,
    companion: @companion})
  json.saved "failed"
end
