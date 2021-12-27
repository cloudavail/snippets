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
def hiking():
    click.echo(f'Hiking sounds fun!')

if __name__ == "__main__":
    location()
