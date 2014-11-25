CLIENTS = {
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com",
  "Parul Singh" => "parul.s@yahoo.com",
  "Gaurav Tiwari" => "gaurav.t@yahoo.com",
  "John Doe" => "j.d@thoughtworks.com",
  "Sheena Li" => "sheena.li@thoughtworks.com",
  "Jay Zay" => "jay.z@thoughtworks.com",
  "Mario Menon" => "m.menon@thoughtworks.com"
}

TEST =  {
  "Peter Wong" => "alphasights.com",
  "Craig Silverstein" => "google.com",
  "Steve Wozniak" => "apple.com",
  "Barack Obama" => "whitehouse.gov",
  "Parul Singh" => "yahoo.com",
  "Murli Ramanatham" => "thoughtworks.com"
}

GIVEN_FORMATS = [
  -> (name) { name.join('.') },
  -> (name) { name.first + '.' + name.last[0] },
  -> (name) { name.first[0] + '.' + name.last[0] },
  -> (name) { name.first[0] + '.' + name.last }
]
