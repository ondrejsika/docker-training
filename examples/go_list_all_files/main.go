package main

import (
	"fmt"
	"os"
	"path/filepath"
)

func main() {
	root := "/"

	ignoredDirs := map[string]bool{
		"/proc": true,
		"/dev":  true,
		"/sys":  true,
	}

	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			fmt.Printf("Error accessing path %s: %v\n", path, err)
			return nil // Continue walking the filesystem
		}

		// Skip ignored directories
		if info.IsDir() && ignoredDirs[path] {
			return filepath.SkipDir
		}

		fmt.Println(path)
		return nil
	})

	if err != nil {
		fmt.Printf("Error walking the path %s: %v\n", root, err)
	}
}
