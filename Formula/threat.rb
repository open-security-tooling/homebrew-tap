# Proposed by .github/workflows/update.yml after verifying build provenance.
class Threat < Formula
  desc "Threat modeling for developers: plain-file models, explained risk, CI checks"
  homepage "https://github.com/open-security-tooling/threat-model"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/open-security-tooling/threat-model/releases/download/v0.1.1/threat_darwin_arm64"
      sha256 "4d6a2424804496ed4d18ada025410cb186267205c984d3b87bbe5ceb823775f6"
    end
    on_intel do
      url "https://github.com/open-security-tooling/threat-model/releases/download/v0.1.1/threat_darwin_amd64"
      sha256 "57bdc4e671a38bd61cd4195a99449b89df7da1523c6fae403319cec85e887eb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/open-security-tooling/threat-model/releases/download/v0.1.1/threat_linux_arm64"
      sha256 "46212f1aae0bdb2f8bd159a61250fc3c3b81ee5283780cbc239665080eb4c1d7"
    end
    on_intel do
      url "https://github.com/open-security-tooling/threat-model/releases/download/v0.1.1/threat_linux_amd64"
      sha256 "76cf8fda86c544878999b6db9a08a8ed325514f1097eb443bc7eaf2201239471"
    end
  end

  def install
    binary = Dir["threat_*"].fetch(0)
    chmod 0755, binary
    bin.install binary => "threat"
  end

  test do
    assert_equal "threat #{version}", shell_output("#{bin}/threat version").strip
  end
end
