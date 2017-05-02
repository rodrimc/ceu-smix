return
{
  --MEDIA
  {
    x1 = { uri='samples/clock.ogv', z = 2},
    x2 = { uri='samples/lego.ogv', x = 200}
  },
  --LINKS
  {
    {'start', lambda},
    {true, 'start', 'x1'},
    {true, 'start', 'x2'}
  },
  {
    {'stop', 'x1'},
    {true, 'start', 'x1'},
    {true, 'start', 'x2'}
  },
  {
    {'stop', 'x2'},
    {true, 'stop', 'x1', nil, nil, 'normal'}
  }
}

