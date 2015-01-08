if defined?(ChefSpec)

  def start_nfdump_nfcapd(name)
    ChefSpec::Matchers::ResourceMatcher.new(:nfdump_nfcapd, :start, name)
  end

  def stop_nfdump_nfcapd(name)
    ChefSpec::Matchers::ResourceMatcher.new(:nfdump_nfcapd, :stop, name)
  end

  def enable_nfdump_nfcapd(name)
    ChefSpec::Matchers::ResourceMatcher.new(:nfdump_nfcapd, :enable, name)
  end

  def disable_nfdump_nfcapd(name)
    ChefSpec::Matchers::ResourceMatcher.new(:nfdump_nfcapd, :disable, name)
  end

  def restart_nfdump_nfcapd(name)
    ChefSpec::Matchers::ResourceMatcher.new(:nfdump_nfcapd, :restart, name)
  end

end
