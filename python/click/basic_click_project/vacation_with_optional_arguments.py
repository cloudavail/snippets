import click


@click.group('Location')
def location():
    """Where to go on vacation?"""


# top
@location.group()
def spain():
    """Choose a city"""


@location.group()
def hawaii():
    """Choose an activity"""


# level 2
# spain
@spain.command()
def madrid():
    click.echo(f'Enjoy Madrid!')


@spain.command()
def barcelona():
    click.echo(f'Enjoy Barca!')


# hawaii
@hawaii.command()
def beach():
    click.echo(f'Lets go to the beach!')


@hawaii.command()
@click.option('--trail-length', type=int, default=2, help='Length of trail in miles')
def hiking(trail_length):
    click.echo(f'Hiking sounds fun! It will be {trail_length} miles long')


if __name__ == "__main__":
    location()
