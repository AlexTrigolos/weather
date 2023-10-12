# frozen_string_literal: true

def request_stub(method, status, path, body, headers: { 'Content-Type': 'application/json' })
  stub_request(method, path).to_return(status:, body:, headers:)
end
