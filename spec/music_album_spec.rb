require_relative '../classes/music_album'
require_relative '../classes/genre'
require_relative '../classes/label'

describe Album do
  album = Album.new('20/05/2002', true)
  genre = Genre.new('test-Genre')

  it 'album should return "20/05/2002" as its publish_date and "true" as its spotify status' do
    expect(album.publish_date).to eq('20/05/2002')
    expect(album.on_spotify).to eq(true)
  end

  it 'After assigning genre as album genre album.genre should equal genre' do
    album.genre = genre

    expect(album.genre).to eq genre
  end

  it 'test assign author to album' do
    author = double('author', 'items' => [])

    album.author = author
    expect(album.author).to eq author
  end

  it 'test assign source to album' do
    source = double('source', 'items' => [])

    album.source = source
    expect(album.source).to eq source
  end

  it 'test assign label to album' do
    label = Label.new('label', 'Blue')

    album.label = label
    expect(album.label).to eq label
  end

  it 'test album can_be_archived should return true as the on_spotify is set to true' do
    expect(album.can_be_archived?).to be true
  end

  it 'test album archived status, it should return false before calling move_to_archive and true afterwards' do
    expect(album.archived).to be false
    album.move_to_archive
    expect(album.archived).to be true
  end
end
