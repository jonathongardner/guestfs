package main

import (
	"fmt"

	"github.com/jonathongardner/guestfs"
)

func main() {
	fmt.Println("LibGuestfs Version: ", guestfs.VersionString())
}
