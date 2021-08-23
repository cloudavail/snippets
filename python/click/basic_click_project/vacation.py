import argparse


def main():
    parser = argparse.ArgumentParser(description="Decide where to go on vacation!")
    parser.add_argument("-l", "--location", help="choose a valid location to go on vacation",
                        choices=["spain", "hawaii", "Spain", "Hawaii"])
    parser.add_argument("-t", "--todo", help="example usage: --location Hawaii --todo beach,"
                                             " no functionality beyond when used with Hawaii", choices=["beach", "hiking"])
    parser.add_argument("-c", "--city", help="example usage: --location Spain --city Madrid,"
                                             " no functionality beyond when used with Spain", choices=["Madrid", "Barcelona"])
    args = parser.parse_args()
    if args.location in ["Hawaii", "hawaii", "HAWAII"]:
        if args.todo in ["beach", "Beach", "BEACH"]:
            print("Have fun at the beach!")
        elif args.todo in ["Hiking", "hiking", "HIKING"]:
            print("Have fun hiking!")
        else:
            print("Please choose a valid activity in Hawaii")
    elif args.location in ["Spain", "spain", "SPAIN"]:
        if args.city in ["Madrid", "madrid, MADRID"]:
            print("Enjoy Madrid!")
        elif args.city in ["Barcelona", "barcelona", "BARCELONA"]:
            print("Enjoy Barcelona!")
        else:
            print("Please choose a valid city in Spain")
    else:
        print("Please refer to --help or options menu for proper use")


if __name__ == "__main__":
    main()
