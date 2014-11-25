CLIENTS = {
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com",
  "John Doe" => "j.d@thoughtworks.com",
  "Sheena Li" => "sheena.li@thoughtworks.com",
  "Gaurav Tiwari" => "gaurav.t@thoughtworks.com",
  "Mario Menon" => "m.menon@thoughtworks.com"
}

TEST =  {
  "Peter Wong" => "alphasights.com",
  "Craig Silverstein" => "google.com",
  "Steve Wozniak" => "apple.com",
  "Barack Obama" => "whitehouse.gov",
  "Murli Ramanatham" => "thoughtworks.com"
}

GIVEN_FORMATS = [
  -> (name) { name.join('.') },
  -> (name) { name.first + '.' + name.last[0] },
  -> (name) { name.first[0] + '.' + name.last[0] },
  -> (name) { name.first[0] + '.' + name.last }
]
