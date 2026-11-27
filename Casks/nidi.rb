cask "nidi" do
  version "0.16.0"
  sha256 "14af8a408aab9fc4bca46839f94d583b961a7286dafa7512edfd0aad79e2c6c2"

  url "https://nidi.marsdoo.com/v#{version}/Nidi_#{version}_universal.app.tar.gz"
  name "Nidi"
  desc "Chat, mail and AI services in one window"
  homepage "https://nidi.marsdoo.com/"

  livecheck do
    url "https://nidi.marsdoo.com/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Nidi.app"

  # Nidi is self-signed, not notarized, so Gatekeeper would block the first
  # open. This clears the quarantine flag Homebrew puts on the download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Nidi.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.marsderp.nidi",
    "~/Library/Caches/com.marsderp.nidi",
    "~/Library/HTTPStorages/com.marsderp.nidi",
    "~/Library/Preferences/com.marsderp.nidi.plist",
    "~/Library/Saved Application State/com.marsderp.nidi.savedState",
    "~/Library/WebKit/com.marsderp.nidi",
  ]
end
