cask "asya" do
  version "1.0.0"
  sha256 "734e1795aec47a0ad3725421fd90334f5596ace795d4ffdb981b63a89e8ae50a"

  url "https://github.com/MaksimVovk/homebrew-asya/releases/download/v#{version}/Asya-#{version}.dmg"
  name "Asya"
  desc "Capture English words anywhere and learn them with spaced repetition"
  homepage "https://github.com/MaksimVovk/homebrew-asya"

  depends_on macos: ">= :sonoma"

  app "Asya.app"

  # Unsigned build: remove the quarantine flag so Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Asya.app"]
  end

  zap trash: "~/Library/Containers/com.maximvovk.asya"

  caveats <<~EOS
    Asya is not signed by Apple; quarantine was removed during install.
    To add words: select text in any app → right-click → Services → Add to Asya.
    If the item is missing, enable it in System Settings → Keyboard →
    Keyboard Shortcuts → Services → Text.
  EOS
end
