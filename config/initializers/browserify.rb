module BrowserifyRails
  class BrowserifyProcessor < Tilt::Template
    def commonjs_module?
      true
    end
  end
end
