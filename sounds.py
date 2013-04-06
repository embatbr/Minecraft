import pyglet.media


pyglet.resource.path = ['resources/sounds']
pyglet.resource.reindex()


wood_break = pyglet.resource.media('wood_break.wav', streaming=False)
water_break = pyglet.resource.media('water_break.wav', streaming=False)
