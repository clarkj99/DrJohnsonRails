require "swagger_helper"

RSpec.describe "api/v1/encounters_controller", type: :request do
  path "/api/v1/encounters" do
    post "Create an Encounter" do
      tags "Encounters"
      consumes "application/json"
      parameter name: :encounter, in: :body, schema: {
        type: :object,
        properties: {
          patient_id: { type: :integer },
          provider_id: { type: :integer },
        },
        required: ["patient_id", "provider_id"],
      }

      response "201", "encountwer created" do
        let(:encounter) { { patient_id: 10, provider_id: 1 } }
        run_test!
      end

      response "422", "invalid request" do
        let(:encounter) { { patient_id: 10 } }
        run_test!
      end
    end
  end
end
