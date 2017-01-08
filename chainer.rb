require 'formula'

class Chainer < Formula
  url 'https://github.com/pfnet/chainer/archive/v1.0.0.tar.gz'
  head 'https://github.com/pfnet/chainer.git', :using => :git
  homepage 'http://chainer.org/'
  sha256 '6f63507614b45c3fc6b25bdba26c9780887403f260986ccbaa408823ce2ee919'
  version '1.0.0'

  option 'enable-cuda', 'Enable CUDA for nVidia-GPU-mounted Mac'

  depends_on :python if MacOS.version <= :snow_leopard        
  depends_on 'numpy'

  resource "MarkupSafe" do
    url "https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.23.tar.gz"
    sha256 "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"
  end

  resource "Mako" do
    url "https://pypi.python.org/packages/source/M/Mako/Mako-1.0.1.tar.gz"
    sha256 "45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c"
  end

  resource "decorator" do
    url "https://pypi.python.org/packages/source/d/decorator/decorator-3.4.2.tar.gz"
    sha256 "7320002ce61dea6aa24adc945d9d7831b3669553158905cdd12f5d0027b54b44"
  end

  resource "py" do
    url "https://pypi.python.org/packages/source/p/py/py-1.4.28.tar.gz"
    sha256 "664dbb9fd86c26d26e90aa93d15b8a19c859128bb66b3905bef954eba737eeb5"
  end

  resource "pytest" do
    url "https://pypi.python.org/packages/source/p/pytest/pytest-2.7.1.tar.gz"
    sha256 "530f23c79e1b13850e93f3a59720f1eca75bad01307dc4fd694a6a19619fb9cb"
  end

  resource "appdirs" do
    url "https://pypi.python.org/packages/source/a/appdirs/appdirs-1.4.0.tar.gz"
    sha256 "8fc245efb4387a4e3e0ac8ebcc704582df7d72ff6a42a53f5600bbb18fdaadc5"
  end

  resource "six" do
    url "https://pypi.python.org/packages/source/s/six/six-1.9.0.tar.gz"
    sha256 "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
  end

  resource "pytools" do
    url "https://pypi.python.org/packages/source/p/pytools/pytools-2014.3.5.tar.gz"
    sha256 "62a77a3c1865d5254ce212473da2af04f43d82eb0020ae9a009f97408e74968e"
  end

  resource "pycuda" do
    url "https://pypi.python.org/packages/source/p/pycuda/pycuda-2014.1.tar.gz"
    sha256 "28e8f7425d0bac03a6c80346a4e150024ef0e4740ce11cb54e6aef351127d7af"
  end

  resource "scikits.cuda" do
    url "https://pypi.python.org/packages/source/s/scikits.cuda/scikits.cuda-0.5.0b2.tar.gz"
    sha256 "17ef97d0e9639156c5f21c8b84dcad9eb48901a797201fcb95464fcc70f07931"
  end

  def install
    if build.include? "enable-cuda"
      ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
      %w[MarkupSafe Mako decorator py pytest appdirs six pytools pycuda scikits.cuda].each do |r|
        resource(r).stage do
          system "python", *Language::Python.setup_install_args(libexec/"vendor")
        end
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(prefix)
  end

  def test
    system "false"
  end
end
