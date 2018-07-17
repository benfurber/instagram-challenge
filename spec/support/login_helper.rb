def mock_login
  user = create(:user)
  allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  allow(controller).to receive(:current_user).and_return(user)
end
